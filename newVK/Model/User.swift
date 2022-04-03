//
//  Friends.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class User {
    var id: Int
    var avatar: UIImage?
    var name: String
    var photo: [UIImage?]
    var ratingLike: [[Int]]
        
    init(id: Int, image: UIImage?, name: String, photo: [UIImage?], ratingLike: [[Int]]) {
        self.avatar = image
        self.name = name
        self.photo = photo
        self.id = id
        self.ratingLike = ratingLike
    }
}
