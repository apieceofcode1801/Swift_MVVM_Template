//
//  Todo.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation

struct Todo: Codable {
    let userId, id: Int
    let title: String
    let completed: Bool
}
