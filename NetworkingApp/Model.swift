//
//  Model.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import Foundation

struct Model: Decodable {
    
    let name: String?
    let age: Int?
    let count: Int?
    
    init(name: String, age: Int, count: Int) {
        self.name = name
        self.age = age
        self.count = count
    }
    
    init(fetchedData: [String: Any]) {
        name = fetchedData["name"] as? String
        age = fetchedData["age"] as? Int
        count = fetchedData["count"] as? Int
    }
    
    static func getModel(from value: Any) -> Model {
        guard let modelData = value as? [String: Any] else { return Model.init(name: "", age: 0, count: 0) }
        let model = Model.init(fetchedData: modelData)
        return model
    }
    
}
