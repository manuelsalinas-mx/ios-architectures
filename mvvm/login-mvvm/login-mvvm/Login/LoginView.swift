//
//  ViewController.swift
//  login-mvvm
//
//  Created by Manuel Salinas on 1/9/24.
//

import UIKit
import Combine

class LoginView: UIViewController {
    @IBOutlet private weak var txtEmail: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    @IBOutlet private weak var btnLogin: UIButton!
    @IBOutlet private weak var lblErrorMessage: UILabel!

    private let loginViewModel = LoginViewModel(apiClient: APIClient())
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        createBindingViewWithViewModel()
    }

    @IBAction
    private func startLogin() {
        guard let email = txtEmail.text, let password = txtPassword.text else { return }

        loginViewModel.userLogin(email: email,
                                 password: password)
    }

    func createBindingViewWithViewModel() {
        txtEmail.textPublisher.assign(to: \LoginViewModel.email, on: loginViewModel)
            .store(in: &cancellables)

        txtPassword.textPublisher.assign(to: \LoginViewModel.password, on: loginViewModel)
            .store(in: &cancellables)

        loginViewModel.$isEnabled
            .assign(to: \.isEnabled, on: btnLogin)
            .store(in: &cancellables)

        loginViewModel.$showLoading
            .assign(to: \.configuration!.showsActivityIndicator, on: btnLogin)
            .store(in: &cancellables)

        loginViewModel.$errorMessage
            .assign(to: \UILabel.text!, on: lblErrorMessage)
            .store(in: &cancellables)

        loginViewModel.$user
            .sink { [weak self] user in

                guard let user else { return }

                let homeView = HomeView(user: user)
                self?.present(homeView, animated: true)
        }
            .store(in: &cancellables)
    }
}

// MARK: - UITextfield extension
extension UITextField {
    var textPublisher: AnyPublisher<String, Never>{
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in
                return (notification.object as? UITextField)?.text ?? ""
            }
            .eraseToAnyPublisher()
    }
}

