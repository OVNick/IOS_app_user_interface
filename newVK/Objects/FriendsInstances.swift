//
//  FriendsInstances.swift
//  newVK
//
//  Created by Николай Онучин on 26.02.2022.
//

import UIKit

class FriendsInstances {
    
    var userName: [String] = [
        "Альберт Эйнштейн",
        "Никола Тесла",
        "Роберт Дауни",
        "Скарлетт Йоханссон",
        "Бенедикт Камбербэтч",
        "Томас Харди",
        "Бри Ларсон",
        "Стив Джобс",
        "Зендея",
        "Крис Хемсворт",
        "Том Холланд"
    ]
    
    var userPhoto: [[UIImage?]] = [
        [UIImage.init(named: "1_1.jpg"), UIImage.init(named: "1_2.jpg"), UIImage.init(named: "1_3.jpg"), UIImage.init(named: "1_4.jpg"), UIImage.init(named: "1_5.jpg")],
        [UIImage.init(named: "2_1.jpg"), UIImage.init(named: "2_2.jpg"), UIImage.init(named: "2_3.jpg")],
        [UIImage.init(named: "3_1.jpg"), UIImage.init(named: "3_2.jpg"), UIImage.init(named: "3_3.jpg"), UIImage.init(named: "3_4.jpg")],
        [UIImage.init(named: "4_1.jpg"), UIImage.init(named: "4_2.jpg"), UIImage.init(named: "4_3.jpg"), UIImage.init(named: "4_4.jpg")],
        [UIImage.init(named: "5_1.jpg"), UIImage.init(named: "5_2.jpg"), UIImage.init(named: "5_3.png"), UIImage.init(named: "5_4.jpg"), UIImage.init(named: "5_5.jpg")],
        [UIImage.init(named: "6_1.jpg"), UIImage.init(named: "6_2.jpg"), UIImage.init(named: "6_3.jpg"), UIImage.init(named: "6_4.jpg")],
        [UIImage.init(named: "7_1.jpg"), UIImage.init(named: "7_2.jpg"), UIImage.init(named: "7_3.jpg"), UIImage.init(named: "7_4.jpg")],
        [UIImage.init(named: "8_1.jpg"), UIImage.init(named: "8_2.jpg"), UIImage.init(named: "8_3.jpg"), UIImage.init(named: "8_4.jpg")],
        [UIImage.init(named: "9_1.jpg"), UIImage.init(named: "9_2.jpg"), UIImage.init(named: "9_3.jpg"), UIImage.init(named: "9_4.jpg"), UIImage.init(named: "9_5.jpg")],
        [UIImage.init(named: "10_1.jpg"), UIImage.init(named: "10_2.jpg"), UIImage.init(named: "10_3.jpg"), UIImage.init(named: "10_4.jpg"), UIImage.init(named: "10_5.jpg")],
        [UIImage.init(named: "11_1.jpg"), UIImage.init(named: "11_2.jpg"), UIImage.init(named: "11_3.jpg"), UIImage.init(named: "11_4.jpg")]
    ]
        
    var userRatingLike: [[[Int]]] = [
        [[0], [2, 3], [2, 3, 4], [2, 3, 4, 5], [2, 3, 4, 5, 6]],
        [[1, 3], [1, 3, 4], [1, 3, 4, 5]],
        [[1, 2, ], [2, 3], [2, 3, 4], [2, 3, 4, 5]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [2, 3, 4, 5, 6]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [2, 3, 4, 5, 6]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [2, 3, 4, 5, 6]],
        [[2], [2, 3], [2, 3, 4], [2, 3, 4, 5]]
    ]
    
    var myFriends: [User] {
        get {
            var objects = [User]()
            for index in 1...userName.count {
                objects.append(User.init(id: index-1, image: userPhoto[index-1][0], name: userName[index-1], photo: userPhoto[index-1], ratingLike: userRatingLike[index-1]))
            }
            return objects
        }
    }
}
