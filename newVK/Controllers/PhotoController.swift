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
    
    var someUser: User = User(image: UIImage.init(named: "name"), name: "image", photo: [], like: 0)
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPhoto.image = someUser.photo[index]
        
        likeControl.likeCounter = someUser.like
        guard likeControl.likeCounter > 0 else {
            likeControl.likeLabel.text = ""
            return
        }
        likeControl.likeLabel.text = "\(likeControl.likeCounter)"
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
