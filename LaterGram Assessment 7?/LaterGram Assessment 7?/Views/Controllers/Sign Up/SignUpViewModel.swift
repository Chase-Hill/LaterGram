//
//  SignUpViewModel.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit
import FirebaseAuth

struct SignUpViewModel {
    
    // MARK: - Functions
    func createAccount(email: String, password: String, confirmPassword: String) {
        
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error {
                    print(error.localizedDescription)
                }
                
                if let authResult {
                    let user = authResult.user
                    print(user.uid)
                }
            }
        } else {
            print("Password don't match.")
        }
    }
}
