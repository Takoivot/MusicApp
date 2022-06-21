//
//  MusicListViewCell.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 17.06.2022.
//

import UIKit

class MusicListViewCell: UITableViewCell {
    
    @IBOutlet var artistName: UILabel!
    @IBOutlet var songName: UILabel!
    
    func settingsCell(with track: Tracks ){
        artistName.text = track.artistName
        songName.text = track.trackName
        
    }
}


