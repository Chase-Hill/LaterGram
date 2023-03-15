//
//  Firebase Service.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/15/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

struct FirebaseService {
    
    // MARK: - Properties
    let ref = Firestore.firestore()
    let storage = Storage.storage().reference()
    
    // MARK: - Functions
    func savePost(user: String, body: String, image: UIImage, uuid: String, completion: @escaping () -> Void) {
        
        let uuid = UUID().uuidString
        
        saveImage(image, with: uuid) { result in
            switch result {
            case .success(let imageURL):
                let post = Post(postUser: user, postBody: body, postImageURL: imageURL.absoluteString, uuid: uuid)
                ref.collection(Constants.Post.collectionRef).document(post.uuid).setData(post.dictionaryRepresentation)
                completion()
            case .failure(let failure):
                print(failure) ; return
            }
        }
    }
    
    func loadPosts(completion: @escaping (Result <[Post], NetworkError>) -> Void) {
        ref.collection(Constants.Post.collectionRef).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.thrownError(error))) ; return
            }
            
            guard let docSnapshot = snapshot?.documents else { completion(.failure(.noData)) ; return }
            let dictionaryArray = docSnapshot.compactMap { $0.data() }
            let posts = dictionaryArray.compactMap { Post(fromDictionary: $0) }
            completion(.success(posts))
        }
    }
    
    func deletePost(with post: Post) {
        ref.collection(Constants.Post.collectionRef).document(post.uuid).delete()
    }
    
    func saveImage(_ image: UIImage, with uuidString: String, completion: @escaping (Result <URL, NetworkError>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return }
        
        let uploadedMetadata = StorageMetadata()
        uploadedMetadata.contentType = "image/jpeg"
        
        let uploadTask = storage.child(Constants.Post.storageRef).child(uuidString).putData(imageData, metadata: uploadedMetadata) { _, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.thrownError(error))) ; return
            }
        }
        
        uploadTask.observe(.success) { _ in
            print("Image Uploaded Successfully")
            self.storage.child(Constants.Post.storageRef).child(uuidString).downloadURL { url, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(.thrownError(error))) ; return
                }
                
                if let url {
                    print("Image URL: \(url)")
                    completion(.success(url))
                }
            }
        }
        
        uploadTask.observe(.failure) { snapshot in
            completion(.failure(.thrownError(snapshot.error!))) ; return
        }
    }
    
    func fetchImage(from post: Post, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
        storage.child(Constants.Post.storageRef).child(post.uuid).getData(maxSize: 1024 * 1024) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { completion(.failure(.unableToDecode)) ; return }
                completion(.success(image))
            case .failure(let error):
                completion(.failure(.thrownError(error))) ; return
            }
        }
    }
    
    func deleteImage(from post: Post) {
        storage.child(Constants.Post.storageRef).child(post.uuid).delete(completion: nil)
    }
    
    func update(_ post: Post, with newImage: UIImage, completion: @escaping () -> Void) {
        saveImage(newImage, with: post.uuid) { result in
            switch result {
            case .success(let imageURL):
                post.postImageURL = imageURL.absoluteString
                ref.collection(Constants.Post.collectionRef).document(post.uuid).setData(post.dictionaryRepresentation)
                completion()
            case .failure(let failure):
                print(failure) ; return
            }
        }
    }
} // End of Class
