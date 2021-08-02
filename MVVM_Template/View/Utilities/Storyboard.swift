//
//  Storyboard.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import Foundation

enum Storyboard {
    case TodoList
    
    var name: String {
        switch self {
        case .TodoList:
           return "TodoList"
        }
    }
}
