//
//  FavoriteListViewCell.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 27.06.2022.
//

import UIKit

class FavoriteListViewCell: UITableViewCell {

    @IBOutlet var imageFavoriteSong: UIImageView!
    @IBOutlet var favoriteArtistName: UILabel!
    @IBOutlet var favoriteSongName: UILabel!
    
    func settingsCell(with track: Tracks ){
        imageFavoriteSong.layer.cornerRadius = imageFavoriteSong.frame.height / 2
        imageFavoriteSong.contentMode = .scaleAspectFill
        imageFavoriteSong.layer.masksToBounds = true
        favoriteArtistName.text = track.artistName
        favoriteSongName.text = track.trackName
        
        NetworkManager.shared.fetchImage(with: track) { result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    self.imageFavoriteSong.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }

}
