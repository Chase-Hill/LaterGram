//
//  FeedViewModel.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/18/23.
//

import Foundation
import FirebaseAuth

protocol FeedViewModelDelegate: AnyObject {
    func postsLoadedSuccessfully()
}

class FeedViewModel {
    
    // MARK: - Properties
    var posts: [Post] = []
    private var service: FirebaseSyncable
    private weak var delegate: FeedViewModelDelegate?
    
    init(service: FirebaseSyncable = FirebaseService(), delegate: FeedViewModelDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    // MARK: - Functions
    func loadPosts() {
        service.loadPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.delegate?.postsLoadedSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signOutAccount() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
