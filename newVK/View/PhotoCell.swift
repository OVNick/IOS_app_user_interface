//
//  PhotoCell.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var photoImage: UIImageView!
    
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
