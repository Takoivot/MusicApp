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
    @IBOutlet var imageSong: UIImageView!
    
    func settingsCell(with track: Tracks ){
        imageSong.layer.cornerRadius = imageSong.frame.height / 2
        imageSong.contentMode = .scaleAspectFill
        imageSong.layer.masksToBounds = true
        artistName.text = track.artistName
        songName.text = track.trackName
        
        NetworkManager.shared.fetchImage(with: track) { result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    self.imageSong.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}


