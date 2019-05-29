//
//  TaskCompletionViewController.swift
//  TodoApp
//
//  Created by S. M.Hasibur Rahman on 27/5/19.
//  Copyright © 2019 S. M. Hasibur Rahman. All rights reserved.
//

import UIKit

class TaskCompletionViewController: UIViewController {

    var previousVC = TodoTableViewController()//must create instance otherwise TaskCompletionViewController class can't be initialized or previousVC have to be optional
    //var selectedAsCompleted = TodoTask()
    var selectedAsCompleted = TodoTaskCoreData()
    
    @IBOutlet weak var taskTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //taskTitle.font.withSize(50.0)
        taskTitle.numberOfLines = 0//allow taskname to take as many lines as it requires
        taskTitle.text = selectedAsCompleted.name
    }  
    
    @IBAction func taskCompletion(_ sender: Any) {
        //let index = find(previousVC.map({ }) ,selectedAsCompleted)
        /*var index: Int = 0
        for (index1,toDoTask) in previousVC.todoTaskList.enumerated(){
            if toDoTask.name == selectedAsCompleted.name{
                 index = index1
            }
        }
        
        previousVC.todoTaskList.remove(at: index)
        previousVC.tableView.reloadData()
 */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            
            context.delete(selectedAsCompleted)
        }
        navigationController?.popViewController(animated: true)
    }
}
