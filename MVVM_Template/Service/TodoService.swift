//
//  TodoService.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation
import Combine

typealias Todos = [Todo]

protocol TodoServiceProtocol {
    var networkService: NetworkServiceProtocol { get }
    
    func getTodos() -> AnyPublisher<Todos, Error>
    func getTodo(id: Int) -> AnyPublisher<Todo, Error>
}

// By marking the class as final, we signal to other developers that this class is not designed to be subclassed.
final class TodoService: TodoServiceProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    
    func getTodos() -> AnyPublisher<Todos, Error> {
        let endpoint = Endpoint.todos
        return networkService.get(type: Todos.self, url: endpoint.url, headers: endpoint.headers)
    }
    
    func getTodo(id: Int) -> AnyPublisher<Todo, Error> {
        let endpoint = Endpoint.todo(id: id)
        return networkService.get(type: Todo.self, url: endpoint.url, headers: endpoint.headers)
    }
}
