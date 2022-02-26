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
        Group(image: UIImage.init(named: "Einstein_01"), name: "Все относительно"),
        Group(image: UIImage.init(named: "Cumberbatch"), name: "Овсянка, сэр!"),
        Group(image: UIImage.init(named: "Tesla"), name: "Что такое электричество?"),
        Group(image: UIImage.init(named: "Perov"), name: "Охота"),
        Group(image: UIImage.init(named: "Fishing"), name: "Рыбалка"),
        Group(image: UIImage.init(named: "Sport"), name: "Спорт")
    ]
    
    var myGroups = [
        Group(image: UIImage.init(named: "Avengers"), name: "Подслушано Мстители"),
        Group(image: UIImage.init(named: "Einstein_01"), name: "Все относительно")
    ]
}
