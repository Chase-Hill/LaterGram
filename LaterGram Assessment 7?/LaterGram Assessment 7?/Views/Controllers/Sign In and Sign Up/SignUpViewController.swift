//
//  SignUpViewController.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
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
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
