//
//  NewsCollectionLayout.swift
//  newVK
//
//  Created by Николай Онучин on 03.04.2022.
//

import UIKit

class NewsCollectionLayout: UICollectionViewLayout {

    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var cellHeight: CGFloat = 0
    var cellWidth: CGFloat = 0
    private var totalCellsHeight: CGFloat = 0
    
    override func prepare() {
        
        self.cacheAttributes = [:]
        
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
                
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        let frame: CGFloat = collectionView.frame.width
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            switch itemsCount {
            case 1:
                cellWidth = frame
                cellHeight = frame
                totalCellsHeight = frame
            case 2:
                cellWidth = frame/2
                cellHeight = frame/2
                if index == 1 {
                    lastX = frame/2
                    totalCellsHeight = frame/2
                }
            case 3:
                cellHeight = frame/2
                if index == 0 {
                    cellWidth = frame
                } else if index == 1 {
                    cellWidth = frame/2
                    lastY = frame/2
                } else {
                    lastX = frame/2
                    totalCellsHeight = frame
                }
            default:
                if index < 4 {
                    cellWidth = frame/2
                    cellHeight = frame/2
                    if index == 1 {
                        lastX = frame/2
                    } else if index == 2 {
                        lastX = 0
                        lastY = frame/2
                    } else if index == 3 {
                        lastX = frame/2
                        totalCellsHeight = frame
                    }
                }
            }
            
            attributes.frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: cellHeight)
            
            cacheAttributes[indexPath] = attributes
        }
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
