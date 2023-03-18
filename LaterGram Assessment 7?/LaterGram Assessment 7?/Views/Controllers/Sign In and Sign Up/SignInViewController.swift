//
//  SignInViewController.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
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
}
