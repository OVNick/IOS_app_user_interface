//
//  AllGroupController.swift
//  newVK
//
//  Created by Николай Онучин on 23.02.2022.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var objects = GroupsInstances()
    let service = RequestService()
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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredGroups.count
        }
        return objects.allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as? AllGroupsCell else {
            preconditionFailure("Error")
        }
        
        var groups = objects.allGroups
        
        if isFiltering {
            groups = filteredGroups
        }
        
        cell.imageAllGroupCell.image = groups[indexPath.row].image
        cell.labelAllGroupCell.text = groups[indexPath.row].name
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - UISearchResultsUpdating
extension AllGroupsController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        let groups = objects.allGroups
        filteredGroups = groups.filter({ (group: Group)  in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        
        service.APIRequest(requestType: .groupsSearch, sender: searchText)
        
        tableView.reloadData()
    }
}
