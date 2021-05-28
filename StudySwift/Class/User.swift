//
//  User.swift
//  StudySwift
//
//  Created by macbook on 2021/5/14.
//

import Foundation

struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> else {
            return nil
        }
        guard let name = obj["name"] as? String else {
            return nil
        }
        guard let message = obj["message"] as? String else {
            return nil
        }
        self.name = name
        self.message = message
    }
    init?(dictionary: Dictionary<String, Any>) {
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        guard let message = dictionary["message"] as? String else {
            return nil
        }
        self.name = name
        self.message = message
    }
}


struct Banner {
    let image: String
    let title: String
    let url: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> else {
            return nil
        }
        guard let image = obj["image"] as? String else {
            return nil
        }
        guard let title = obj["title"] as? String else {
            return nil
        }
        guard let url = obj["url"] as? String else {
            return nil
        }
        self.image = image
        self.title = title
        self.url = url
    }
    init?(dictionary: Dictionary<String, Any>) {
        guard let image = dictionary["image"] as? String else {
            return nil
        }
        guard let title = dictionary["title"] as? String else {
            return nil
        }
        guard let url = dictionary["url"] as? String else {
            return nil
        }
        self.image = image
        self.title = title
        self.url = url
    }
}
