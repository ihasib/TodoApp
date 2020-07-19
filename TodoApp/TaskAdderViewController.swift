//
//  TaskAdderViewController.swift
//  TodoApp
//
//  Created by S. M.Hasibur Rahman on 25/5/19.
//  Copyright © 2019 S. M. Hasibur Rahman. All rights reserved.
//

import UIKit

class TaskAdderViewController: UIViewController {
    
    var previousVC = TodoTableViewController()
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var isImportant: UISwitch!
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTaskTapped(_ sender: Any) {
        //task creation
        /*
        let task = TodoTask()
        
        task.isImportant = isImportant.isOn
        if(task.isImportant){
            task.name = "❗️"
        }
        
        if let taskName = taskTitleTextField.text {
            task.name += taskName
        }
        previousVC.todoTaskList.append(task)
        previousVC.tableView.reloadData()
        */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let task = TodoTaskCoreData(entity: TodoTaskCoreData.entity(), insertInto: context)
            
            if let taskName = taskTitleTextField.text {
                task.name = taskName
                task.isImportant = isImportant.isOn
                if isImportant.isOn {
                    task.name = task.name! + "❗️"
                }
            }
            try? context.save()
        }        
        
        navigationController?.popViewController(animated: false)
    }
}
