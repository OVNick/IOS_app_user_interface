//
//  NewsInstances.swift
//  newVK
//
//  Created by Николай Онучин on 02.04.2022.
//

import UIKit

class NewsInstances {
    
    var avatar: [UIImage?] = [
        UIImage.init(named: "Avengers.jpg"),
        UIImage.init(named: "3_1.jpg")
    ]
    
    var name: [String] = [
        "Подслушано Мстители",
        "Роберт Дауни"
    ]
    
    var date: [String] = [
        "02.04.2022",
        "01.04.2022"
    ]
    
    let text: [String] = [
        "Совсем скоро в кино!",
        "Тестирую новый костюм!"
    ]
    
    var photo: [[UIImage?]] = [
        [UIImage.init(named: "7_1.jpg"), UIImage.init(named: "3_4.jpg"), UIImage.init(named: "10_5.jpg")],
        [UIImage.init(named: "3_3.jpg")]
    ]
    
    var ratingLike: [[Int]] = [
        [2, 3, 4, 5, 6],
        [1, 3, 4, 5]
    ]
    
    var myNews: [News] {
        get {
            var objects = [News]()
            for index in 1...name.count {
                objects.append(News.init(avatar: avatar[index-1], name: name[index-1], date: date[index-1], text: text[index-1], photo: photo[index-1], ratingLike: ratingLike[index-1]))
            }
            return objects
        }
    }
}
