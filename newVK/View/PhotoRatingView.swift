//
//  LikeView.swift
//  newVK
//
//  Created by Николай Онучин on 06.03.2022.
//

import UIKit

class PhotoRatingView: UIView {

    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIStackView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hadleTap))
        tap.numberOfTapsRequired = 1
        container.addGestureRecognizer(tap)
    }
    
    @objc func hadleTap(_ : UITapGestureRecognizer) {
        likeControl.isLike.toggle()
        
        if likeControl.isLike {
            likeControl.likePicture.tintColor = .red
            likeControl.likePicture.image = UIImage(systemName: "suit.heart.fill")
            
            likeControl.likeLabel.textColor = .red
            likeControl.likeLabel.text = "\(likeControl.likeCounter + 1)"
        } else {
            likeControl.likePicture.tintColor = .lightGray
            likeControl.likePicture.image = UIImage(systemName: "suit.heart")
            
            likeControl.likeLabel.textColor = .lightGray
            guard likeControl.likeCounter > 0 else {
                likeControl.likeLabel.text = ""
                return
            }
            likeControl.likeLabel.text = "\(likeControl.likeCounter)"
        }
    }
}
