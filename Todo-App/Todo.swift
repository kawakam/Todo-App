
//
//  Todo.swift
//  Todo-App
//
//  Created by 川上智樹 on 5/3/16.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit

enum TodoPriority: Int {
    case Low    = 0
    case Middle = 1
    case High   = 2
    
    func color() -> UIColor {
        switch self {
        case .Low:
            return UIColor.yellowColor()
        case .Middle:
            return UIColor.greenColor()
        case .High:
            return UIColor.redColor()
        }
    }
}

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority: TodoPriority = .Low
    
    init(title: String, descript: String, priority: TodoPriority) {
        self.title = title
        self.descript = descript
        self.priority = priority
    }
    
    func convertDictionary(todo: Todo) -> Dictionary<String, AnyObject> {
        var dic = Dictionary<String, AnyObject>()
        dic["title"] = todo.title
        dic["descript"] = todo.descript
        dic["priority"] = todo.priority.rawValue
        return dic
    }
    
    
    class func convertTodoModel(attiributes: Dictionary<String, AnyObject>) -> Todo {
        let todo = Todo(title: attiributes["title"] as! String, descript: attiributes["descript"] as! String, priority: TodoPriority(rawValue: attiributes["priority"] as! Int)!)
        return todo
    }
}
