//
//  GroupController.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class MyGroupsController: UITableViewController {
    
    var objects = GroupsInstances()
    private var filteredGroups = [Group]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredGroups.count
        }
        return objects.myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? MyGroupsCell else {
            preconditionFailure("Groupcell cannot")
        }
        
        var groups = objects.myGroups
        
        if isFiltering {
            groups = filteredGroups
        }
        
        cell.imageGroupCell.image = groups[indexPath.row].image
        cell.labelGroupCell.text = groups[indexPath.row].name
        
        return cell
    }
    
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? AllGroupsController,
              let indexPath = sourceVC.tableView.indexPathForSelectedRow else { return }
        
        let newGroup = sourceVC.objects.allGroups[indexPath.row]
        
        if !objects.myGroups.contains(where: {$0.name == newGroup.name}) {
            objects.myGroups.append(newGroup)
            tableView.reloadData()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyGroupsController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        let groups = objects.myGroups
        filteredGroups = groups.filter({ (group: Group)  in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
