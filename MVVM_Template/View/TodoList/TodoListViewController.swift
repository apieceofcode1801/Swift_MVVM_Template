//
//  TodoListViewController.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import UIKit

class TodoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = TodoListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.loadTodoList()
    }
    
    private var todos = [Todo]()
}

extension TodoListViewController: TodoListViewProtocol {
    func displayTodos(_ todos: [Todo]) {
        if todos.isEmpty {
            return
        }
        self.todos = todos
        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = todos[indexPath.row]
        cell.setTodo(todo)
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        let vc = TodoViewController.initFromStoryboard()
        vc.todoId = todo.id
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TodoListViewController: StoryboardInitializable {
    static var storyboard: Storyboard = Storyboard.TodoList
}
