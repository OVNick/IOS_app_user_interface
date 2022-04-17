//
//  PhotoController.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class AllPhotoController: UICollectionViewController {
    
    var object: User = User(id: 0, image: UIImage.init(named: "name"), name: "image", photo: [], ratingLike: [[]])
    let service = RequestService()

    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // test
        service.APIRequest(requestType: .photosGetAll, sender: "-24791065")
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath
            let destinationVC = segue.destination as! PhotoController            
            destinationVC.object = object
            destinationVC.index = indexPath.row
        }
    }
        
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return object.photo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? AllPhotoCell else { preconditionFailure("Error")
        }
        
        cell.photoImage.image = object.photo[indexPath.row]        
        return cell
    }
}
