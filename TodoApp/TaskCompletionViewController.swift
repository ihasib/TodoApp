//
//  TaskCompletionViewController.swift
//  TodoApp
//
//  Created by S. M.Hasibur Rahman on 27/5/19.
//  Copyright © 2019 S. M. Hasibur Rahman. All rights reserved.
//

import UIKit

class TaskCompletionViewController: UIViewController {

    var previousVC = TodoTableViewController()
    var selectedAsCompleted = TodoTask()
    
    @IBOutlet weak var taskTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //taskTitle.font.withSize(50.0)
        taskTitle.numberOfLines = 0
        taskTitle.text = selectedAsCompleted.name
    }  
    
    @IBAction func taskCompletion(_ sender: Any) {
        //let index = find(previousVC.map({ }) ,selectedAsCompleted)
        var index: Int = 0
        for (index1,toDoTask) in previousVC.todoTaskList.enumerated(){
            if toDoTask.name == selectedAsCompleted.name{
                 index = index1
            }
            
        }
        
        previousVC.todoTaskList.remove(at: index)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
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
