//
//  NewsCollectionLayout.swift
//  newVK
//
//  Created by Николай Онучин on 03.04.2022.
//

import UIKit

class NewsCollectionLayout: UICollectionViewLayout {

    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var cellHeight: CGFloat = 128
    private var totalCellsHeight: CGFloat = 0
    
    override func prepare() {
        
        self.cacheAttributes = [:]
        
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
                
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            switch itemsCount {
            case 1:
                attributes.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.width)
                lastY = collectionView.frame.width
            default:
                if index < 2 {
                    attributes.frame = CGRect(x: lastX, y: lastY, width: collectionView.frame.width/2, height: collectionView.frame.width/2)
                    lastX += (collectionView.frame.width/2)
                } else if index == 2 {
                    lastX = 0
                    lastY = collectionView.frame.width/2
                    attributes.frame = CGRect(x: lastX, y: lastY, width: collectionView.frame.width, height: collectionView.frame.width/2)
                    lastY = collectionView.frame.width
                }
            }
            cacheAttributes[indexPath] = attributes
        }
        totalCellsHeight = lastY
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter {
            attributes in return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellsHeight)
    }
}
