//
//  SignInViewController.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    // MARK: - Properties
    var viewModel: SignInViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignInViewModel()
        assignbackground()
    }
    
    // MARK: - Action
    @IBAction func logInButtonTapped(_ sender: Any) {
        guard let email = userEmailTextField.text,
              let password = userPasswordTextField.text else { return }
        
        viewModel.signInAccount(email: email, password: password) { [weak self] success in
            if success {
                let destinationVC = FeedCollectionViewController()
                self?.present(destinationVC, animated: true, completion: nil)
            } else {
                self?.presentIncorrectCredentialsAlert()
            }
        }
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
    
    func presentIncorrectCredentialsAlert() {
        let alert = UIAlertController(title: "Incorrect Credentials", message: "It appears the email and password entered does not match or has not been created yet.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Understood", style: .default)
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}
