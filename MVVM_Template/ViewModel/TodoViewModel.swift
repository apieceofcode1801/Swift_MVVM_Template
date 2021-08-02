//
//  TodoViewModel.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation
import Combine

protocol TodoViewProtocol: AnyObject {
    func displayTodo(_ todo: Todo)
    func displayError(_ error: String)
}

class TodoViewModel {
    weak var view: TodoViewProtocol?
    private let todoService: TodoService
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.todoService = TodoService(networkService: NetworkService())
    }
    
    func loadTodo(_ id: Int) {
        todoService.getTodo(id: id)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.view?.displayError("Couldn't load todo")
                    }
                case .finished:
                    break
                }
            } receiveValue: { todo in
                DispatchQueue.main.async {
                    self.view?.displayTodo(todo)
                }
            }
            .store(in: &subscriptions)
    }
}
