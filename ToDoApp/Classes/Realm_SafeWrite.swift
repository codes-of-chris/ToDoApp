//
// Created by Chris Andrews on 14/03/2019.
// Copyright (c) 2019 Chris Andrews. All rights reserved.
//

import UIKit

import UIKit
import RealmSwift

extension Realm {

    public func safeWrite(_ block: (() throws -> Void)) throws {

        if (isInWriteTransaction) {

            try block()
        }
        else {

            refresh()
            try write(block)
        }
    }
}


