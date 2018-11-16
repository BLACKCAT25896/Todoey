//
//  Item.swift
//  Todoey
//
//  Created by Kamrujjaman on 11/16/18.
//  Copyright © 2018 Kamrujjaman. All rights reserved.
//

import Foundation
import RealmSwift
class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
