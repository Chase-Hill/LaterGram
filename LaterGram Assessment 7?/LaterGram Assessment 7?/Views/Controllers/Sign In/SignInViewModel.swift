//
//  SignInViewModel.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import Foundation
import FirebaseAuth

struct SignInViewModel {
    
    func signInAccount(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print(error.localizedDescription)
            }
            
            if let authResult {
                let user = authResult.user
                print(user.uid)
            }
        }
    }
}
