//
//  ViewController.swift
//  ToDo
//
//  Created by Chris Andrews on 14/03/2019.
//  Copyright © 2019 Chris Andrews. All rights reserved.
//

import UIKit
import RxSwift
import RxRealm
import RealmSwift
import Rswift

class LandingViewController: UIViewController {

    @IBOutlet weak var addToDoButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    private let realm = try! Realm()

    override func viewDidLoad() {

        super.viewDidLoad()

        Observable.array(from: realm.objects(ToDo.self))
                .bind(to: tableView.rx.items(cellIdentifier: R.reuseIdentifier.toDoCell.identifier, cellType: ToDoCell.self)) { (row, element, cell) in

                    cell.setup(title: element.title, description: element.toDoDescription)
                }
                .disposed(by: rx.disposeBag)

        addToDoButton.rx.tap
                .subscribe(onNext: { [weak self] in

                    let addTodoViewController = R.storyboard.main.addTodoViewController()!
                    self?.show(addTodoViewController, sender: self)
                })
                .disposed(by: rx.disposeBag)
    }
}

