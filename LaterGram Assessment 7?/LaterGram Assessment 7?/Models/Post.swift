//
//  Post.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/13/23.
//

import UIKit

class Post {
    
    enum Key {
        static let user = "user"
        static let body = "body"
        static let date = "date"
        static let image = "image"
        static let uuid = "uuid"
    }
    
    let postUser: String
    let postBody: String
    let postDate: Date
    let postImage: UIImage?
    let uuid: String
    
    // No taxation without
    var dictionaryRepresentation: [String : AnyHashable] {
        [Key.user: self.postUser,
         Key.body: self.postBody,
         Key.date: self.postDate,
         Key.image: self.postImage,
         Key.uuid: self.uuid
        ]
    }
    
    init(postUser: String, postBody: String, postDate: Date = Date(), postImage: UIImage?, uuid: String = UUID().uuidString) {
        self.postUser = postUser
        self.postBody = postBody
        self.postDate = postDate
        self.postImage = postImage
        self.uuid = uuid
    }
}

extension Post {
    convenience init?(fromDictionary dictionary: [String: Any]) {
        guard let user = dictionary[Key.user] as? String,
              let body = dictionary[Key.body] as? String,
              let date = dictionary[Key.date] as? Date,     // Check here
              let image = dictionary[Key.image] as? UIImage,     // Check here
              let uuid = dictionary[Key.uuid] as? String else { print("Check Model for bullshittery") ; return nil }
        
        self.init(postUser: user, postBody: body, postDate: date, postImage: image, uuid: uuid)
    }
}

extension Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
