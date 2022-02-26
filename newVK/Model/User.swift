//
//  Friends.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class User {
    let image: UIImage?
    let name: String
    let photo: [String]

    init(image: UIImage? = nil, name: String, photo: [String] = []) {
        self.image = image
        self.name = name
        self.photo = photo
    }
}
