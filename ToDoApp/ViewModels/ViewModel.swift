//
//  ViewModel.swift
//  ToDo
//
//  Created by Chris Andrews on 14/03/2019.
//  Copyright © 2019 Chris Andrews. All rights reserved.
//

import UIKit

struct ViewModel {
    
    func isTitleValid(title: String) -> Bool{
        
        return title.count != 0
    }

    func isDescriptionValid(description: String) -> Bool{

        return description.count != 0
    }
}
