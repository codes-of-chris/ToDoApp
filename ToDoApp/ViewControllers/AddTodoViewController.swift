//
//  AddTodoViewController.swift
//  ToDo
//
//  Created by Chris Andrews on 14/03/2019.
//  Copyright © 2019 Chris Andrews. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift
import NSObject_Rx

class AddTodoViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!

    @IBOutlet weak var addToDoButton: UIButton!
    @IBOutlet weak var backButton: UIButton!

    let viewModel = ViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()

        let titleValid = titleTextView.rx.text.orEmpty
        let descriptionValid = descriptionTextView.rx.text.orEmpty

        let todoObject = Observable.combineLatest(titleValid, descriptionValid)

        todoObject
                .map { [viewModel] (text, description) in
                    viewModel.isTitleValid(title: text) && viewModel.isDescriptionValid(description: description)
                }
                .bind(to: addToDoButton.rx.isEnabled)
                .disposed(by: rx.disposeBag)

        backButton.rx.tap
                .subscribe(onNext: { [weak self] in

                    self?.dismiss(animated: true, completion: nil)
                })
                .disposed(by: rx.disposeBag)

        addToDoButton.rx.tap
                .withLatestFrom(todoObject)
                .subscribe(onNext: { [weak self] (title, description) in

                    guard let realm = try? Realm() else {

                        print("Failed to initiate realm")
                        return
                    }

                    do {

                        try realm.safeWrite {

                            let todo = ToDo()
                            todo.title = title
                            todo.toDoDescription = description

                            realm.add(todo, update: true)
                            self?.dismiss(animated: true, completion: nil)
                        }
                    }
                    catch {

                        print("An error occurred when writing to the database")
                    }
                })
                .disposed(by: rx.disposeBag)
    }
}