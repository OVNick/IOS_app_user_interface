//
//  PhotoController.swift
//  newVK
//
//  Created by Николай Онучин on 06.03.2022.
//

import UIKit

class PhotoController: UIViewController {

    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet var likeControl: LikeControl!
    
    var object: User = User(id: 0, image: UIImage.init(named: "name"), name: "image", photo: [], like: 0, ratingLike: [[]])
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPhoto.image = object.photo[index]
        
        likeControl.likeCounter = object.ratingLike[index].count
        guard likeControl.likeCounter > 0 else {
            likeControl.likeLabel.text = ""
            return
        }
        likeControl.likeLabel.text = "\(likeControl.likeCounter)"
    }
 
    /*
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    }
    */
}
