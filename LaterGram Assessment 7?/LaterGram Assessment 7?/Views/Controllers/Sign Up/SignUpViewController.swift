//
//  SignUpViewController.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    
    // MARK: - Properties
    var viewModel: SignUpViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignUpViewModel()
        assignbackground()
    }
    
    // MARK: - Action
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        guard let email = userEmailTextField.text,
              let password = userPasswordTextField.text,
              let confirmPassword = userConfirmPasswordTextField.text else { return }
        
        if password != confirmPassword {
            presentPasswordsDontMatchAlert()
        } else {
            print(NetworkError.unknownError)
        }
        
        viewModel.createAccount(email: email, password: password, confirmPassword: confirmPassword)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Functions
    func assignbackground() {
        let background = UIImage(named: "gradient")
        
        var backGroundImageView : UIImageView!
        backGroundImageView = UIImageView(frame: view.bounds)
        backGroundImageView.contentMode =  UIView.ContentMode.scaleAspectFill
        backGroundImageView.clipsToBounds = true
        backGroundImageView.image = background
        backGroundImageView.center = view.center
        backGroundImageView.alpha = 1
        view.addSubview(backGroundImageView)
        self.view.sendSubviewToBack(backGroundImageView)
    }

    func presentPasswordsDontMatchAlert() {
        let alert = UIAlertController(title: "Passwords Do Not Match", message: "It appears the password you entered does not match. Please re-enter passwords and try again.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Sounds Good", style: .default)
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}
