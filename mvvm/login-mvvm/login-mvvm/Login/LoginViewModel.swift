//
//  LoginViewModel.swift
//  login-mvvm
//
//  Created by Manuel Salinas on 1/9/24.
//

import Foundation
import Combine

class LoginViewModel{
    @Published var email = ""
    @Published var password = ""
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMessage = ""
    @Published var user: User?

    var cancellables = Set<AnyCancellable>()

    let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient

        formValidation()
    }

    func formValidation() {
        Publishers.CombineLatest($email, $password)
            .filter { email, password in
                return email.count > 5 && password.count > 5
            }
            .sink { value in
                print("Email: ", value.0)
                print("Password: ", value.1)

                self.isEnabled = true
            }
            .store(in: &cancellables)
    }

    @MainActor
    func userLogin(email: String, password: String) {
        errorMessage = ""
        showLoading = true
        Task {
            do {
                user = try await apiClient.login(email: email, password: password)
            } catch let error as BackendError {
                print(error.localizedDescription)
                errorMessage = error.rawValue
            }

            showLoading = false
        }
    }
}
