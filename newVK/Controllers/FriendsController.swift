//
//  FriendsController.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class FriendsController: UITableViewController {
    
    @IBOutlet var avatarView: AvatarView!
    
    var objects = FriendsInstances()
    var sortedObjects = [Character: [User]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sortedObjects = sort(objects: objects.myFriends)
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
    }
        
    private func sort(objects: [User]) -> [Character: [User]] {
        var objectsDict = [Character: [User]]()
        
        objects.forEach() { object in
            guard let firstChar = object.name.first else { return }
            
            if var thisCharObjects = objectsDict[firstChar] {
                thisCharObjects.append(object)
                objectsDict[firstChar] = thisCharObjects
            } else {
                objectsDict[firstChar] = [object]
            }
        }
        return objectsDict
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedObjects.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keySorted = sortedObjects.keys.sorted()
        let objects = sortedObjects[keySorted[section]]?.count ?? 0
        
        return objects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            preconditionFailure("Friendscell cannot")
        }
        
        let firstChar = sortedObjects.keys.sorted()[indexPath.section]
        let objects = sortedObjects[firstChar]!
        let object: User = objects[indexPath.row]
        
        cell.imageFriendsCell.image = object.avatar
        cell.labelFriendsCell.text = object.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedObjects.keys.sorted()[section])
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showAllPhoto",
              let destinationVC = segue.destination as? AllPhotoController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let keys = Array(sortedObjects.keys.sorted())
        let objectsInKey: [User]
        
        objectsInKey = sortedObjects[keys[indexPath.section]]!
        
        destinationVC.object = objectsInKey[indexPath.row]
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

    
    // MARK: - Navigation

    @IBAction func tapButtonExit(_ sender: Any) {
        performSegue(withIdentifier: "exit", sender: nil)
    }
     
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
