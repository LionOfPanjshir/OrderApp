//
//  Order.swift
//  OrderApp
//
//  Created by Andrew Higbee on 11/12/23.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
