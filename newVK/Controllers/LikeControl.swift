//
//  LikeControl.swift
//  newVK
//
//  Created by Николай Онучин on 28.02.2022.
//

import UIKit

class LikeControl: UIControl {
    
    @IBOutlet var likePicture: UIImageView!
    @IBOutlet var likeLabel: UILabel!
    
    var isLike: Bool = false
    var likeCounter: UInt = 0
}
