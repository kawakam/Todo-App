
//
//  Todo.swift
//  Todo-App
//
//  Created by 川上智樹 on 5/3/16.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority: TodoPriority = .Low
    
    init(title: String, descript: String, priority: TodoPriority) {
        self.title = title
        self.descript = descript
        self.priority = priority
    }
    
    func convertDictionary() -> [String: AnyObject] {
        var dic = [String: AnyObject]()
        dic["title"] = title
        dic["descript"] = descript
        dic["priority"] = priority.rawValue
        return dic
    }
    
    
    class func convertTodoModel(attiributes: [String: AnyObject]) -> Todo {
        let title = attiributes["title"] as! String
        let descript = attiributes["descript"] as! String
        let priority = TodoPriority(rawValue: attiributes["priority"] as! Int)!
        let todo = Todo(title: title, descript: descript, priority: priority)
        return todo
    }
}
