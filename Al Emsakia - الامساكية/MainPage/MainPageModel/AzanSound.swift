import Foundation
import UIKit
import AVFoundation

extension MainViewController {
    
    func playSound(sound: String , Withextension: String) {
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: Withextension) else {
            print("URL not found")
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
