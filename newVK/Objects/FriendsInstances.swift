//
//  FriendsInstances.swift
//  newVK
//
//  Created by Николай Онучин on 26.02.2022.
//

import UIKit

class FriendsInstances {
    let myFriends = [
        User(image: UIImage.init(named: "1_1"), name: "Альберт Эйнштейн", photo: [UIImage.init(named: "1_1.jpg"), UIImage.init(named: "1_2.jpg"), UIImage.init(named: "1_3.jpg"), UIImage.init(named: "1_4.jpg"), UIImage.init(named: "1_5.jpg")], like: 10, ratingLike: [1: ["1_1": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "1_2": [2, 3, 4, 5, 6, 7, 8, 9], "1_3": [2, 3, 4, 5, 6, 7], "1_4": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "1_5": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "2_1.jpg"), name: "Никола Тесла", photo: [UIImage.init(named: "2_1.jpg"), UIImage.init(named: "2_2.jpg"), UIImage.init(named: "2_3.jpg")], like: 20, ratingLike: [2: ["2_1" : [1, 3, 4, 5, 6, 7, 8, 9, 10, 11], "2_2": [1, 3, 4, 5, 6, 7, 8, 9, 10], "2_3" : [1, 3, 4, 5, 6, 7, 8]]]),
        User(image: UIImage.init(named: "3_1.jpg"), name: "Роберт Дауни", photo: [UIImage.init(named: "3_1.jpg"), UIImage.init(named: "3_2.jpg"), UIImage.init(named: "3_3.jpg"), UIImage.init(named: "3_4.jpg")], like: 30, ratingLike: [3: ["3_1": [1, 2, 4, 5, 6, 7, 8, 9, 10, 11], "3_2": [1, 2, 4, 5, 6, 7, 8, 9, 10], "3_3": [1, 2, 4, 5, 6, 7, 8], "3_4" : [1, 2, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "4_1.jpg"), name: "Скарлетт Йоханссон", photo: [UIImage.init(named: "4_1.jpg"), UIImage.init(named: "4_2.jpg"), UIImage.init(named: "4_3.jpg"), UIImage.init(named: "4_4.jpg")], like: 40, ratingLike: [4: ["4_1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "4_2": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "4_3": [1, 2, 3, 4, 5, 6, 7, 8], "4_4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "5_2.jpg"), name: "Бенедикт Камбербэтч", photo: [UIImage.init(named: "5_1.jpg"), UIImage.init(named: "5_2.jpg"), UIImage.init(named: "5_3.png"), UIImage.init(named: "5_4.jpg"), UIImage.init(named: "5_5.jpg")], like: 50, ratingLike: [5: ["5_1": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "5_2": [2, 3, 4, 5, 6, 7, 8, 9], "5_3": [2, 3, 4, 5, 6, 7], "5_4": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "5_5": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "6_1.jpg"), name: "Томас Харди", photo: [UIImage.init(named: "6_1.jpg"), UIImage.init(named: "6_2.jpg"), UIImage.init(named: "6_3.jpg"), UIImage.init(named: "6_4.jpg")], like: 60, ratingLike: [6: ["6_1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "6_2": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "6_3": [1, 2, 3, 4, 5, 6, 7, 8], "6_4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "7_1.jpg"), name: "Бри Ларсон", photo: [UIImage.init(named: "7_1.jpg"), UIImage.init(named: "7_2.jpg"), UIImage.init(named: "7_3.jpg"), UIImage.init(named: "7_4.jpg")], like: 70, ratingLike: [7: ["7_1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "7_2": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "7_3": [1, 2, 3, 4, 5, 6, 7, 8], "7_4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "8_1.jpg"), name: "Стив Джобс", photo: [UIImage.init(named: "8_1.jpg"), UIImage.init(named: "8_2.jpg"), UIImage.init(named: "8_3.jpg"), UIImage.init(named: "8_4.jpg")], like: 80, ratingLike: [8: ["8_1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "8_2": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "8_3": [1, 2, 3, 4, 5, 6, 7, 8], "8_4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "9_1.jpg"), name: "Зендея", photo: [UIImage.init(named: "9_1.jpg"), UIImage.init(named: "9_2.jpg"), UIImage.init(named: "9_3.jpg"), UIImage.init(named: "9_4.jpg"), UIImage.init(named: "9_5.jpg")], like: 90, ratingLike: [9: ["9_1": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "9_2": [2, 3, 4, 5, 6, 7, 8, 9], "9_3": [2, 3, 4, 5, 6, 7], "9_4": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "9_5": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "10_1.jpg"), name: "Крис Хемсворт", photo: [UIImage.init(named: "10_1.jpg"), UIImage.init(named: "10_2.jpg"), UIImage.init(named: "10_3.jpg"), UIImage.init(named: "10_4.jpg"), UIImage.init(named: "10_5.jpg")], like: 100, ratingLike: [10: ["10_1": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "10_2": [2, 3, 4, 5, 6, 7, 8, 9], "10_3": [2, 3, 4, 5, 6, 7], "10_4": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "10_5": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]]),
        User(image: UIImage.init(named: "11_1.jpg"), name: "Том Холланд", photo: [UIImage.init(named: "11_1.jpg"), UIImage.init(named: "11_2.jpg"), UIImage.init(named: "11_3.jpg"), UIImage.init(named: "11_4.jpg")], like: 110, ratingLike: [11: ["11_1": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "11_2": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "11_3": [1, 2, 3, 4, 5, 6, 7, 8], "11_4": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]])
    ]
}
