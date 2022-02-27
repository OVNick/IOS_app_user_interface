//
//  LikeStackView.swift
//  newVK
//
//  Created by Николай Онучин on 28.02.2022.
//

import UIKit

class LikeView: UIView {

    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!

    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hadleTap))
        tap.numberOfTapsRequired = 2
        //likeControl.addGestureRecognizer(tap)
        container.addGestureRecognizer(tap)
    }

    @objc func hadleTap(_ : UITapGestureRecognizer) {
        likeControl.isLike.toggle()

        if likeControl.isLike {
            likeControl.likePicture.image = UIImage(systemName: "suit.heart.fill")
        } else {
            likeControl.likePicture.image = nil
        }
    }
}
