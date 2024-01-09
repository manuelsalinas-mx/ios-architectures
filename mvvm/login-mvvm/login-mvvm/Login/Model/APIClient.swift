//
//  APIClient.swift
//  login-mvvm
//
//  Created by Manuel Salinas on 1/9/24.
//

import Foundation

enum BackendError: String, Error {
    case invalidEmail = "Email is incorrect"
    case invalidPassword = "Invalid password"
}


final class APIClient {
    func login(email: String, password: String) async throws -> User {
        // Simulating HTTP request with a local delay for 2 seconds
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateLogin(email, password)
    }
}

func simulateLogin(_ email: String, _ password: String) throws -> User {
    guard email == "manuels@mail.com" else {
        print("Incorrect username")
        throw BackendError.invalidEmail
    }
    
    guard password == "123Tamarindo" else {
        print("Incorrect password")
        throw BackendError.invalidPassword
    }

    print("Success")
    return .init(name: "Manuel",
                 token: "fev9ev9ev9berver0vbrvwrvv1erv15168",
                 sessionStart: .now)
}
