//
//  TodoCollection.swift
//  Todo-App
//
//  Created by 川上智樹 on 5/3/16.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    static let sharedInstance = TodoCollection()
    var todos:[Todo] = []
    
    func addTodoCollection(todo: Todo){
        self.todos.append(todo)
        self.save()
    }
    
    func save() {
        var todoList = [[String: AnyObject]]()
        for todo in todos {
            let todoDic = todo.convertDictionary()
            todoList.append(todoDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(todoList, forKey: "todoLists")
        defaults.synchronize()
    }
    
    func fetchTodos() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let todoList = defaults.objectForKey("todoLists") as? [[String: AnyObject]] {
            for todoDic in todoList {
                let todo = Todo.convertTodoModel(todoDic)
                self.todos.append(todo)
            }
        }
    }
}
