//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Md. Nashar Ahmed on 5/24/19.
//  Copyright © 2019 S. M. Hasibur Rahman. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todoTaskList: [TodoTask] = []
    let cellId = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTaskList = createTodos()
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
        cell.textLabel?.text = todoTaskList[indexPath.row].name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = todoTaskList[indexPath.row]
        performSegue(withIdentifier: "moveToCompletionVC", sender: selectedTask)
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
            if let selectedTask = sender as? TodoTask{
                completionVC.selectedAsCompleted = selectedTask//propagate data to the destination
                completionVC.previousVC = self //storing data back to this sender object
            }
        }
        
    }
    

}
