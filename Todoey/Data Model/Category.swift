//
//  Category.swift
//  Todoey
//
//  Created by Kamrujjaman on 11/16/18.
//  Copyright © 2018 Kamrujjaman. All rights reserved.
//

import Foundation
import RealmSwift
class Category: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
    

}
