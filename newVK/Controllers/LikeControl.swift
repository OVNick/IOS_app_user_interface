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
    var likeCounter: Int = 0
    
    override func awakeFromNib() {
        
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .lightGray
        likePicture.image = UIImage(systemName: "suit.heart")
        
        likeLabel.backgroundColor = .clear
        likeLabel.textColor = .lightGray
    }
}
