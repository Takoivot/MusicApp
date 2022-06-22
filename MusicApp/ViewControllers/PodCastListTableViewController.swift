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
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        setupSearchBar()
        configureNavBar()
       
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
    private func configureNavBar() {
        tableView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.7529411765, blue: 0.8862745098, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
