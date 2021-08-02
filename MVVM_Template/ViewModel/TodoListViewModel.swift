//
//  TodoListViewModel.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation
import Combine

protocol TodoListViewProtocol: AnyObject {
    func displayTodos(_ todos: [Todo])
}

class TodoListViewModel {
    private(set) var todoList = [Todo]()
    private let todoService: TodoServiceProtocol
    weak var view: TodoListViewProtocol?
    var subcriptions = Set<AnyCancellable>()
    
    init() {
        self.todoService = TodoService(networkService: NetworkService())
    }
    
    func loadTodoList() {
        todoService.getTodos()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Couldn't get todos: \(error)")
                    DispatchQueue.main.async {
                        self.view?.displayTodos([])
                    }
                case .finished: break
                }
            } receiveValue: { todos in
                // Handle data
                DispatchQueue.main.async {
                    self.view?.displayTodos(todos)
                }
            }
            .store(in: &subcriptions)
        
    }
}
