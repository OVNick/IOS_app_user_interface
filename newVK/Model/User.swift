//
//  Friends.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class User {
    var id: UInt = 0
    let avatar: UIImage?
    let name: String
    let photo: [UIImage?]
    var like: UInt
    var ratingLike: [UInt: [String: [UInt]]] // [id: [photoTitle: [id]]]

    init(image: UIImage? = nil, name: String, photo: [UIImage?] = [], like: UInt = 0, ratingLike: [UInt: [String: [UInt]]] = [0: ["": []]]) {
        self.avatar = image
        self.name = name
        self.photo = photo
        self.id += 1
        self.like = like
        self.ratingLike = ratingLike
    }
}
