
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
}
