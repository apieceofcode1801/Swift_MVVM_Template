//
//  TodoViewController.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import UIKit

class TodoViewController: UIViewController {
    @IBOutlet weak var todoLabel: UILabel!
    private let viewModel = TodoViewModel()
    var todoId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        if let id = todoId {
            viewModel.loadTodo(id)
        }
    }
}

extension TodoViewController: TodoViewProtocol {
    func displayError(_ error: String) {
        todoLabel.text = error
    }
    
    func displayTodo(_ todo: Todo) {
        todoLabel.text = todo.title
    }
}

extension TodoViewController: StoryboardInitializable {
    static var storyboard: Storyboard = .TodoList
}
