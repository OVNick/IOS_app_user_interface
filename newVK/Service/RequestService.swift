//
//  FriendsService.swift
//  newVK
//
//  Created by Николай Онучин on 17.04.2022.
//

import Foundation

final class RequestService {
    
    enum Method {
        case friendsGet
        case groupsGet
        case groupsSearch
        case photosGetAll
    }
    
    func APIRequest(requestType: Method, sender: String?) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        
        switch requestType {
        case .friendsGet:
            urlComponents.path = "/method/friends.get"
            urlComponents.queryItems = [
                URLQueryItem(name: "order", value: "hints"),
                URLQueryItem(name: "fields", value: "online, city, photo_50"),
                URLQueryItem(name: "name_case", value: "nom"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
        case .groupsGet:
            urlComponents.path = "/method/groups.get"
            urlComponents.queryItems = [
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
        case .groupsSearch:
            urlComponents.path = "/method/groups.search"
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: sender!),
                URLQueryItem(name: "sort", value: "0"),
                URLQueryItem(name: "count", value: "5"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
        case .photosGetAll:
            urlComponents.path = "/method/photos.getAll"
            urlComponents.queryItems = [
                URLQueryItem(name: "owner_id", value: "\(sender!)"),
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "count", value: "20"),
                URLQueryItem(name: "photo_sizes", value: "1"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
        }
        
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error)
            }
        }.resume()
    }
}
