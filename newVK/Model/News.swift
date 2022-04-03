//
//  News.swift
//  newVK
//
//  Created by Николай Онучин on 02.04.2022.
//

import UIKit

class News {
    
    let avatar: UIImage?
    let name: String
    let date: String
    let text: String
    let photo: [UIImage?]
    let ratingLike: [Int]
    
    init(avatar: UIImage?, name: String, date: String, text: String, photo: [UIImage?], ratingLike: [Int]) {
        self.avatar = avatar
        self.name = name
        self.date = date
        self.text = text
        self.photo = photo
        self.ratingLike = ratingLike
    }
}
