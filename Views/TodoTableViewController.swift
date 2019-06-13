//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Md. Nashar Ahmed on 5/24/19.
//  Copyright © 2019 S. M. Hasibur Rahman. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todoTaskList: [TodoTaskCoreData] = []
    let cellId = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //todoTaskList = createTodos()
        
        //retieve coredata objects
        getTodoTask()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        getTodoTask()
        tableView.reloadData()
    }
    
    
    func getTodoTask(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            //TodoTaskCoreData.fetchRequest()
            if let fetchedTodoTaskList = try? context.fetch(TodoTaskCoreData.fetchRequest()) as? [TodoTaskCoreData] {
                //if let todoTakLis = fetchedTodoTaskList {
                    todoTaskList = fetchedTodoTaskList                
            }
        }
            
    }
    
    func createTodos() -> [TodoTask]{
        
        let buyEgg = TodoTask()
        buyEgg.name = "Buy egg from rokomari store"
        
        let playTennis = TodoTask()
        playTennis.name = "play tennis at 4pm"
        
        return [buyEgg, playTennis]
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoTaskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        // Configure the cell...
        //todoTaskList.count
        cell.textLabel?.text = todoTaskList[indexPath.row].name
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = todoTaskList[indexPath.row]
        
        //-----------way 1------------
//        performSegue(withIdentifier: "moveToCompletionVC", sender: selectedTask)
        
        //-----------way 2------------
        if let completionVC = storyboard?.instantiateViewController(withIdentifier: "completionScene") as? TaskCompletionViewController {
            navigationController?.pushViewController(completionVC, animated: false)
            completionVC.selectedAsCompleted = selectedTask
            completionVC.previousVC = self
        }
        //-----------way 3------------
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let adderVC = segue.destination as? TaskAdderViewController{
            adderVC.previousVC = self
        }
        
        
        if let completionVC = segue.destination as? TaskCompletionViewController{
            if let selectedTask = sender as? TodoTaskCoreData{
                completionVC.selectedAsCompleted = selectedTask//propagate data to the destination
                completionVC.previousVC = self //storing data back to this sender object
            }
        }
        
    }
    

}
