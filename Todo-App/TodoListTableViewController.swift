//
//  TodoListTableViewController.swift
//  Todo-App
//
//  Created by 川上智樹 on 5/3/16.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    let todoCollection = TodoCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoCollection.fetchTodos()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "新規作成", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(TodoListTableViewController.newTodo))
        self.navigationItem.leftBarButtonItem = editButtonItem()
        self.tableView.reloadData()
    }
    
    func newTodo() {
        self.performSegueWithIdentifier("PresentNewTodoViewController", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoCollection.todos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseIdentifier")
        let todo = self.todoCollection.todos[indexPath.row]
        cell.textLabel!.text = todo.title
        cell.detailTextLabel!.text = todo.descript
        cell.textLabel!.font = UIFont(name: "HirakakuProN-W3", size: 15)
        let priorityIcon = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        priorityIcon.layer.cornerRadius = 6
        priorityIcon.backgroundColor = UIColor.redColor()
        cell.accessoryView = priorityIcon
        
        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            self.todoCollection.todos.removeAtIndex(indexPath.row)
            self.todoCollection.save()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        default:
            return
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = self.todoCollection.todos[sourceIndexPath.row]
        self.todoCollection.todos.removeAtIndex(sourceIndexPath.row)
        self.todoCollection.todos.insert(todo, atIndex: destinationIndexPath.row)
        self.todoCollection.save()
    }
}
