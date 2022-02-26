//
//  Friends.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class User {
    var userID: Int = 0
    var avatar: UIImage?
    let name: String
    let photo: [UIImage?]

    init(image: UIImage? = nil, name: String, photo: [UIImage?] = []) {
        self.avatar = image
        self.name = name
        self.photo = photo
        self.userID += 1
    }
}
