//
//  Person.swift
//  StudySwift
//
//  Created by macbook on 2021/5/28.
//

import UIKit

protocol Nameable {
    var name: String { get }
}
protocol Indentifiable {
    var name: String { get }
    var id: Int { get }
}

struct Person : Nameable, Indentifiable {
    let name: String
    let id: Int
}

extension Nameable {
    var name : String {
        return "default"
    }
    
}
extension Indentifiable {
    var name : String {
        return "anthor default"
    }
    
}
