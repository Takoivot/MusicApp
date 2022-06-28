//
//  CMTime + Extension.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 27.06.2022.
//

import Foundation
import AVKit

extension CMTime {
    
    func toDisplayToString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else {return " "}
        let totalSecond = Int(CMTimeGetSeconds(self))
        let seconds = totalSecond % 60
        let minutes = totalSecond / 60
        let timeFromString = String(format: "%02d:%02d", minutes, seconds)
        return timeFromString
    }
}
