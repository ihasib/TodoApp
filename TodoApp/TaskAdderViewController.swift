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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let task = TodoTaskCoreData(entity: TodoTaskCoreData.entity(), insertInto: context)
            
            if let taskName = taskTitleTextField.text {
                task.name = taskName
                task.isImportant = isImportant.isOn
            }
            try? context.save()
        }        
        
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: false)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
