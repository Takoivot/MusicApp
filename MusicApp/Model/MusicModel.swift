//
//  MusicModel.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 17.06.2022.
//

import Foundation

struct MusicModel: Decodable {
    let resultCount: Int
    let results: [Tracks]

}

struct Tracks: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl60: String?
}
