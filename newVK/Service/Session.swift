//
//  Singleton.swift
//  newVK
//
//  Created by Николай Онучин on 13.04.2022.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var token: String?
    var userId: Int?
}
