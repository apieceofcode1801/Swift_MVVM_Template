//
//  Endpoint.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: String] {
        return [:]
    }
}

extension Endpoint {
    static var todos: Self {
        return Endpoint(path: "/todos")
    }
    
    static func todo(id: Int) -> Self {
        return Endpoint(path: "/todos/\(id)")
    }
    
//    static func todos(count: Int) -> Self {
//        return Endpoint(path: "/todos",
//                        queryItems: [
//                            URLQueryItem(name: "limit",
//                                         value: "\(count)")
//                        ]
//        )
//    }
}
