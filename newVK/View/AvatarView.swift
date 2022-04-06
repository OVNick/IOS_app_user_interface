//
//  AvatarView.swift
//  newVK
//
//  Created by Николай Онучин on 27.02.2022.
//

import UIKit

class AvatarView: UIView {
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var shadowView: UIView!
    @IBOutlet var frameOfAvatar: UIView!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 8
        shadowView.layer.shadowOpacity = 0.8
    }
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = bounds.height/2
        shadowView.layer.cornerRadius = bounds.height/2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        frameOfAvatar.transform = frameOfAvatar.transform.scaledBy(x: 0.8, y: 0.8)
        shadowView.transform = shadowView.transform.scaledBy(x: 0.8, y: 0.8)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       usingSpringWithDamping: 0.05,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut) {
            self.frameOfAvatar.transform = self.frameOfAvatar.transform.scaledBy(x: 1.2, y: 1.2)
            self.shadowView.transform = self.shadowView.transform.scaledBy(x: 1.2, y: 1.2)
        }
    }
}
