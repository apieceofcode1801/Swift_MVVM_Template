//
//  TodoCell.swift
//  MVVM_Template
//
//  Created by Trung Hoang on 02/08/2021.
//

import UIKit

class TodoCell: UITableViewCell {
    func setTodo(_ todo: Todo) {
        textLabel?.text = todo.title
        accessoryType = todo.completed ? .checkmark : .none
    }
}
