//
//  NetworkManager.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 17.06.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case decodeError
}

class NetworkManager {
     static let shared = NetworkManager()
    
    func fetchImage(with track: Tracks, completion: @escaping (Result<Data,NetworkError>) -> Void){
        DispatchQueue.global().async {
            guard let url = URL(string: track.artworkUrl60 ?? "" ) else {
                completion(.failure(.invalidURL))
                return
            }
            if let imageData = try? Data(contentsOf: url){
                completion(.success(imageData))
                return
            } else {
                completion(.failure(.invalidData))
                return
            }
        }
    }
    
    func fetchImageCoreData(with track: Track, completion: @escaping (Result<Data,NetworkError>) -> Void){
        DispatchQueue.global().async {
            guard let url = URL(string: track.artworkUrl60 ?? "" ) else {
                completion(.failure(.invalidURL))
                return
            }
            if let imageData = try? Data(contentsOf: url){
                completion(.success(imageData))
                return
            } else {
                completion(.failure(.invalidData))
                return
            }
        }
    }
    
    func fetchTracksAF(searchText: String, completion: @escaping (MusicModel?) -> Void){
        let url = "https://itunes.apple.com/search"
        let parameters = [
            "term":"\(searchText)",
            "limit":"50",
            "media":"music"
        ]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print(error.localizedDescription)
                //completion(.failure(.invalidData))
                return
            }
            
            guard let data = dataResponse.data else {return}
            
            do{
                let track = try JSONDecoder().decode(MusicModel.self, from: data)
                //completion(.success(track))
                completion(track)
                print(track)
            } catch let error{
                print(error.localizedDescription)
                //completion(.failure(.decodeError))
                
            }
        }
    }
    
    private init() {}
    
}
