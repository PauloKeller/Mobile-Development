//
//  Item.swift
//  Todoey
//
//  Created by paulo on 08/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation
import RealmSwift

class ItemModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: CategoryModel.self, property: "items")
}
