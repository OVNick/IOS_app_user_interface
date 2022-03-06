//
//  GroupsInstances.swift
//  newVK
//
//  Created by Николай Онучин on 26.02.2022.
//

import UIKit

struct GroupsInstances {
    let allGroups = [
        Group(image: UIImage.init(named: "Avengers"), name: "Подслушано Мстители"),
        Group(image: UIImage.init(named: "1_2"), name: "Все относительно"),
        Group(image: UIImage.init(named: "5_2"), name: "Овсянка, сэр!"),
        Group(image: UIImage.init(named: "2_1"), name: "Что такое электричество?"),
        Group(image: UIImage.init(named: "Perov"), name: "Охота"),
        Group(image: UIImage.init(named: "Fishing"), name: "Рыбалка"),
        Group(image: UIImage.init(named: "10_2"), name: "Спорт")
    ]
    
    var myGroups = [
        Group(image: UIImage.init(named: "Avengers"), name: "Подслушано Мстители"),
        Group(image: UIImage.init(named: "1_2"), name: "Все относительно")
    ]
}
