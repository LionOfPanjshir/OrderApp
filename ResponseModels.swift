//
//  ResponseModels.swift
//  OrderApp
//
//  Created by Andrew Higbee on 11/12/23.
//

import Foundation

struct MenuResponse: Codable {
    let items: [MenuItem]
}

struct CategoriesResponse: Codable {
    let categories: [String]
}

struct OrderResponse: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
