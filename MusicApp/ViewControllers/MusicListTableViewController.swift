//
//  MusicListTableViewController.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 17.06.2022.
//

import UIKit

class MusicListTableViewController: UITableViewController {
    
    var tracks: MusicModel? = nil
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        //fetchTracksFromNM()
        setupSearchBar()
        configureNavBar()
        
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks?.results.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "music", for: indexPath) as? MusicListViewCell else {return UITableViewCell()}
        guard let track = tracks?.results[indexPath.row] else {return UITableViewCell()}
        cell.settingsCell(with: track)
        cell.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
//        Сделал чтобы по клику на ячейку фон вокруг нее оставался черным, а не серым
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
}

extension MusicListTableViewController {
    /*
     !!!!!! FOR DELETE !!!!!!!!
     func fetchTracksFromNM(){
        NetworkManager.shared.f { result in
            switch result {
            case .success(let tracks):
                self.tracks = tracks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
     !!!!!! FOR DELETE !!!!!!!!
     */
   
}

extension MusicListTableViewController : UISearchBarDelegate{
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    private func configureNavBar() {
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            NetworkManager.shared.fetchTracksAF(searchText: searchText) {result in
                switch result {
                case .success(let tracks):
                    self.tracks = tracks
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
      
       
    }
}
