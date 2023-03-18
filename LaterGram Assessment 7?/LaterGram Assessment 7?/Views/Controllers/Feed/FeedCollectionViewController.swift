//
//  FeedCollectionViewController.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/17/23.
//

import UIKit
import FirebaseAuth

private let reuseIdentifier = "Cell"

class FeedCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var viewModel: FeedViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FeedViewModel(delegate: self)
    }

    // MARK: - Action
    @IBAction func signOutButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Functions

    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
}

// MARK: - Extensions

extension FeedCollectionViewController: FeedViewModelDelegate {
    func postsLoadedSuccessfully() {
        collectionView.reloadData()
    }
}
