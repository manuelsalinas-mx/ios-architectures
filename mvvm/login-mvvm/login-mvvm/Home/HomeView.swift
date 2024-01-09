//
//  HomeView.swift
//  login-mvvm
//
//  Created by Manuel Salinas on 1/9/24.
//

import UIKit

class HomeView: UIViewController {
    private let messageLabel: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 40, weight: .medium, width: .standard)
        label.text = "Bienvenido estas autenticado"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let user: User

    init(user: User) {
        self.user = user

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        messageLabel.text = "Bienvenido \(user.name)"
        view.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
}
