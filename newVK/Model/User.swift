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
    var like: Int
    var ratingLike: [[Int]]
    
    func createUser(_ userName: String) {
        id += 1
        name = userName
    }
    
    func addAnAvatar(_ userAvatar: UIImage?) {
        avatar = userAvatar
    }
    
    func addPhoto(_ userPhotos: [UIImage?]) {
        photo = userPhotos
    }
    
    func addRating(_ userRatingLike: [[Int]]) {
        ratingLike = userRatingLike
    }

    init(){
        self.avatar = nil
        self.name = ""
        self.photo = []
        self.id = 0
        self.like = 0
        self.ratingLike = [[]]
    }
    
    init(id: Int, image: UIImage?, name: String, photo: [UIImage?], like: Int, ratingLike: [[Int]]) {
        self.avatar = image
        self.name = name
        self.photo = photo
        self.id = id
        self.like = like
        self.ratingLike = ratingLike
    }
}
