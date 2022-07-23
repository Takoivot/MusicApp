//
//  TableViewSettings.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 26.06.2022.
//

import UIKit

class TableViewSettings {
    
    static let shared = TableViewSettings()
    
    private init () {}
    
    func tuneViewAppearance(for tableView: UITableView) {
        tableView.rowHeight = 100
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = .none
    }
    
func tuneCellAppearance(for cell: UITableViewCell) {
    cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let backgroundView = UIView()
    backgroundView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    cell.selectedBackgroundView = backgroundView
}
    
}
