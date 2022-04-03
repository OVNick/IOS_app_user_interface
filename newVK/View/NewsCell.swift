//
//  NewsCell.swift
//  newVK
//
//  Created by Николай Онучин on 02.04.2022.
//

import UIKit

class NewsCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var newsLabel: UILabel!
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var newsCollectionView: UICollectionView!
    
    var photo: [UIImage?] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.newsCollectionView.dataSource = self
        self.newsCollectionView.delegate = self
        self.newsCollectionView.register(UINib.init(nibName: "PhotoNewsCell", bundle: nil), forCellWithReuseIdentifier: "PhotoNewsCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoNewsCell", for: indexPath) as? PhotoNewsCell else {
            preconditionFailure("Error")
        }
        cell.photoImage.image = photo[indexPath.row]
        
        return cell
    }
}
