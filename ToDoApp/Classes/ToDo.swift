//
//  ToDo.swift
//  ToDo
//
//  Created by Chris Andrews on 14/03/2019.
//  Copyright © 2019 Chris Andrews. All rights reserved.
//

import Foundation
import RealmSwift

class ToDo: Object {

    @objc dynamic var title = ""
    @objc dynamic var toDoDescription = ""


    enum RealmProperties: String {

        case idKey = "title"
    }

    override static func primaryKey() -> String? {

        return ToDo.RealmProperties.idKey.rawValue
    }
}
