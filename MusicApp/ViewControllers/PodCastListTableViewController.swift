//
//  PodCastListTableViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 21.06.2022.
//

import UIKit

class PodCastListTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewSettings.shared.tuneViewAppearance(for: tableView)
        NavBarSettings.shared.configureNavBar(for: navigationController)
        setupSearchBar()
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
}

extension PodCastListTableViewController : UISearchBarDelegate{
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
