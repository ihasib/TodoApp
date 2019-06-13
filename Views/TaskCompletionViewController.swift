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
//        taskTitle.numberOfLines = 0//allow taskname to take as many lines as it requires
//        taskTitle.text = selectedAsCompleted.name
        taskDetails.text = selectedAsCompleted.name
        addAllSubviews()
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
    
    
    
    //--------------------scene design-------------------
    
    
    //-------------subviews adder---------
    
    
    func addAllSubviews(){
        view.backgroundColor = .white
        
        view.addSubview(taskDetails)
        addTaskDetailsConstraints()
        
        view.addSubview(completionButton)
        addCompletionButtonConstraints()
    }
    

    
    //------------scene components---------
    
    let taskDetails : UILabel = {
        let lbl = UILabel()
        lbl.text =  """
        fgkj
        ssd
        """
        lbl.numberOfLines = 0
        lbl.backgroundColor = UIColor(red: 33/255, green: 100/255, blue: 200/255, alpha: 1.0)
        //lbl.font = UIFont(name: "bold", size: 30.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 30.0)
        return lbl
    }()
    
    let completionButton : UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(taskCompletionBtnTapped), for: .touchUpInside)
        btn.backgroundColor  = .gray
        btn.titleLabel?.textColor = .white
        btn.setTitle("Completed", for: .normal)
        return btn
    }()
    
    @objc func taskCompletionBtnTapped(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            
            context.delete(selectedAsCompleted)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //-----scene components' constraints------
    
    func addTaskDetailsConstraints(){
        taskDetails.translatesAutoresizingMaskIntoConstraints = false
        taskDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskDetails.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        taskDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        taskDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    func addCompletionButtonConstraints(){
        completionButton.translatesAutoresizingMaskIntoConstraints = false
        completionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        completionButton.topAnchor.constraint(equalTo: taskDetails.bottomAnchor, constant: 100).isActive = true
        completionButton.widthAnchor.constraint(equalTo: taskDetails.widthAnchor, multiplier: 1/2).isActive = true
        completionButton.heightAnchor.constraint(equalToConstant: 30)
    }
}

