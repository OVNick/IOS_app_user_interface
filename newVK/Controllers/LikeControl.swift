//
//  LikeControl.swift
//  newVK
//
//  Created by Николай Онучин on 28.02.2022.
//

import UIKit

class LikeControl: UIControl {
    
    @IBOutlet var likePicture: UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }
}
