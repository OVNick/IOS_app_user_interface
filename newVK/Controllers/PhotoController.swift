//
//  PhotoController.swift
//  newVK
//
//  Created by Николай Онучин on 06.03.2022.
//

import UIKit

class PhotoController: UIViewController {

    @IBOutlet var photoNavigation: UINavigationItem!
    @IBOutlet var photoRatingView: PhotoRatingView!
    @IBOutlet var likeControl: LikeControl!
    
    var imageViewOne: UIImageView!
    var imageViewTwo: UIImageView!
    
    var object: User = User(id: 0, image: UIImage.init(named: "name"), name: "image", photo: [], ratingLike: [[]])
    var index: Int = 0
    var nextIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextIndex = index
        
        initViews()
        createPhotoViewConstraints()
        setRating()
        setNumberOfPhoto()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(viewPanned))
        view.addGestureRecognizer(gesture)
    }
    
    func setRating() {
        likeControl.likeCounter = object.ratingLike[index].count
        
        guard likeControl.likeCounter > 0 else {
            likeControl.likeLabel.text = ""
            return
        }
        
        likeControl.likeLabel.text = "\(likeControl.likeCounter)"
    }
    
    func setNumberOfPhoto() {
        photoNavigation.title = "\(nextIndex+1) из \(object.photo.count)"
    }
    
    @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
        
        let percent = 1 - abs(recognizer.translation(in: view).x / view.frame.width)
       
        switch recognizer.state {
            
        case .changed:
            
            if recognizer.translation(in: view).x < 0 {
                index < object.photo.count-1 ? (self.nextIndex = index + 1) : (self.nextIndex = index)
            } else {
                index > 0 ? (self.nextIndex = index - 1) : (self.nextIndex = index)
            }
            
            if index < nextIndex {
                imageViewTwo.image = object.photo[nextIndex]
                imageViewTwo.backgroundColor = UIColor.systemGray5
                imageViewTwo.transform = CGAffineTransform(translationX: view.frame.width + recognizer.translation(in: view).x, y: 0.0)
                
                imageViewOne.image = object.photo[index]
                if percent > 0.8 {
                    imageViewOne.transform = CGAffineTransform(scaleX: percent, y: percent)
                }
                imageViewOne.alpha = percent
                
            } else if index > nextIndex {
                imageViewTwo.image = object.photo[index]
                imageViewTwo.backgroundColor = UIColor.systemGray5
                imageViewTwo.transform = CGAffineTransform(translationX: recognizer.translation(in: view).x, y: 0.0)
                
                imageViewOne.image = object.photo[nextIndex]
                if percent > 0.5 {
                    imageViewOne.transform = CGAffineTransform(scaleX: 1.5-percent, y: 1.5-percent)
                }
                imageViewOne.alpha = 1-percent
                
            } else {
                imageViewTwo.image = object.photo[index]
                imageViewTwo.backgroundColor = UIColor.systemGray5
                if percent > 0.8 {
                    imageViewTwo.transform = CGAffineTransform(translationX: recognizer.translation(in: view).x, y: 0.0)
                }
                
                imageViewOne.image = nil
            }
            
        case .ended:
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                
            }

            if index < nextIndex {
                if percent < 0.5 {
                    UIView.animate(withDuration: 0.16, delay: 0, options: .curveEaseOut) { [self] in
                        imageViewTwo.transform = .identity
                    } completion: { [self] _ in
                        imageViewOne.transform = .identity
                        imageViewOne.alpha = 1
                        imageViewOne.image = object.photo[nextIndex]
                        imageViewTwo.image = nil
                        imageViewTwo.backgroundColor = nil
                    }
                    setRating()
                    setNumberOfPhoto()
                    index = nextIndex
                
                } else {
                    UIView.animate(withDuration: 0.16, delay: 0, options: .curveEaseOut) { [self] in
                        imageViewTwo.transform = imageViewTwo.transform.translatedBy(x: view.frame.width, y: 0)
                        imageViewOne.transform = .identity
                        imageViewOne.alpha = 1
                    }
                }
                
            } else if index > nextIndex {
                if percent < 0.5 {
                    UIView.animate(withDuration: 0.16, delay: 0, options: .curveEaseOut) { [self] in
                        imageViewTwo.transform = imageViewTwo.transform.translatedBy(x: view.frame.width, y: 0)
                        imageViewOne.transform = .identity
                        imageViewOne.alpha = 1
                        //imageViewOne.image = object.photo[nextIndex]
                    }
                    setRating()
                    setNumberOfPhoto()
                    index = nextIndex
                 
                } else {
                    UIView.animate(withDuration: 0.16, delay: 0, options: .curveEaseOut) { [self] in
                        imageViewTwo.transform = .identity
                    }
                }
                
            } else {
                UIView.animate(withDuration: 0.16, delay: 0, options: .curveEaseOut) { [self] in
                    imageViewTwo.transform = .identity
                }
            }

        default:
            break
        }
    }
 
    func initViews() {
        // Init
        self.imageViewOne = UIImageView()
        self.imageViewTwo = UIImageView()
        
        // Prepare auto layout
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        // Set background color
        imageViewOne.backgroundColor = nil
        imageViewTwo.backgroundColor = nil
        
        // Set content mode
        imageViewOne.contentMode = .scaleAspectFit
        imageViewTwo.contentMode = .scaleAspectFit
        
        // Additional option
        imageViewOne.image = object.photo[index]
        
        // Add to the superview
        self.view.addSubview(imageViewOne)
        self.view.addSubview(imageViewTwo)
    }
    
    func createPhotoViewConstraints() {
        
        // Creating constraints for imageViewOne
        
        let pinLeftImageViewOne = NSLayoutConstraint(item: imageViewOne!,
                                                  attribute: NSLayoutConstraint.Attribute.left,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.left,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let pinTopImageViewOne = NSLayoutConstraint(item: imageViewOne!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: self.view.safeAreaLayoutGuide,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 multiplier: 1.0,
                                                 constant: 0)
        let pinRightImageViewOne = NSLayoutConstraint(item: imageViewOne!,
                                                  attribute: NSLayoutConstraint.Attribute.right,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.right,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let pinBottomImageViewOne = NSLayoutConstraint(item: imageViewOne!,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1.0,
                                                  constant: -48)

        // Creating constraints for imageViewTwo
        
        let pinLeftImageViewTwo = NSLayoutConstraint(item: imageViewTwo!,
                                                  attribute: NSLayoutConstraint.Attribute.left,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.left,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let pinTopImageViewTwo = NSLayoutConstraint(item: imageViewTwo!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: self.view.safeAreaLayoutGuide,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 multiplier: 1.0,
                                                 constant: 0)
        let pinRightImageViewTwo = NSLayoutConstraint(item: imageViewTwo!,
                                                  attribute: NSLayoutConstraint.Attribute.right,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.right,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let pinBottomImageViewTwo = NSLayoutConstraint(item: imageViewTwo!,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view.safeAreaLayoutGuide,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1.0,
                                                  constant: -48)

        self.view.addConstraints([pinLeftImageViewOne, pinTopImageViewOne, pinRightImageViewOne, pinBottomImageViewOne,
                                  pinLeftImageViewTwo, pinTopImageViewTwo, pinRightImageViewTwo, pinBottomImageViewTwo])
    }
    
    /*
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    }
    */
}
