//
//  MusicStreamViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 21.06.2022.
//

import UIKit


class MusicStreamViewController: UIViewController {
    
    var track: Tracks?
    
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        settings()
        
    }
    
    @IBAction func handleCurrentTimeSlider(_ sender: Any) {
    }
    
    @IBAction func handleVolumeSlider(_ sender: Any) {
    }
    @IBAction func previousTrack(_ sender: Any) {
    }
    @IBAction func nextTrack(_ sender: Any) {
    }
    @IBAction func playPauseAction(_ sender: Any) {
    }
    
    func settings(){
        artistName.text = track?.artistName
        trackName.text = track?.trackName
    }
    
}

extension MusicStreamViewController {
    private func configureNavBar() {
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.7529411765, blue: 0.8862745098, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
