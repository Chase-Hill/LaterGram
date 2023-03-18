//
//  FeedCollectionViewCell.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/18/23.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var postUserImage: UIImageView!
    @IBOutlet weak var postUsernameLabel: UILabel!
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    
    // MARK: - Properties
    let service = FirebaseService()
    
    // MARK: - Functions
    func configure(withPost post: Post) {
        postUsernameLabel.text = post.postUser
        postCaptionLabel.text = post.postBody
        postTimeLabel.text = post.postDate.dateAsString()
        
        service.fetchImage(from: post) { result in
            switch result {
            case .success(let image):
                self.postUserImage.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
