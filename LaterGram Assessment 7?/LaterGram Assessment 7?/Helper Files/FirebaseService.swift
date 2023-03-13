//
//  FirebaseService.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/13/23.
//

import Foundation
import FirebaseFirestore

protocol FirebaseSyncable {
    func save(with post: Post)
}

struct FirebaseService {
    
    // MARK: - Properties
    let ref = Firestore.firestore()
    
    // MARK: - Functions
    func save(with post: Post) {
        ref.collection("Posts").document(post.uuid).setData(post.dictionaryRepresentation)
    }
}
