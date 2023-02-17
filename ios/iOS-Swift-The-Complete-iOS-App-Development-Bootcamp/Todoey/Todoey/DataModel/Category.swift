//
//  Category.swift
//  Todoey
//
//  Created by paulo on 08/06/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryModel: Object {
    @objc dynamic var name:String = ""
    let items = List<ItemModel>()
}
