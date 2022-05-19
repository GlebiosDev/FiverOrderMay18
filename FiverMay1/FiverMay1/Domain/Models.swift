//
//  Models.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 19.05.2022.
//

import UIKit

class Section {
    var name: String
    var items: [Cell]
    var collapsed: Bool
    
    init(name: String, items: [Cell], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

struct Cell {
    var title: String?
    var subTitle: String?
    var value: String?
    var icon: UIImage?
    
    init(icon: UIImage? = nil ,title: String? = nil, subTitle: String? = nil, value: String? = nil) {
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
        self.value = value
    }
}
