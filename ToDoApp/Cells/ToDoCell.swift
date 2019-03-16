//
//  ToDo.swift
//  ToDo
//
//  Created by Chris Andrews on 15/03/2019.
//  Copyright © 2019 Chris Andrews. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoDescriptionLabel: UILabel!

    func setup(title: String, description: String) {

        todoTitleLabel.text = title
        todoDescriptionLabel.text = description
    }
}

