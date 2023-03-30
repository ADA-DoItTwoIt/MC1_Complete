//
//  SoundSetting.swift
//  partTest
//
//  Created by 주환 on 2023/03/29.
//

import SwiftUI
import AVKit

final class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    var normalPlayer: AVAudioPlayer?
    var backgroundPlayer: AVAudioPlayer?
    let speedControl = AVAudioUnitVarispeed()
    
    func playSound(formusicName musicName: String) {
        guard let url = Bundle.main.url(forResource: musicName, withExtension: ".mp3") else { return }
        
        do {
            normalPlayer?.enableRate = true
            normalPlayer = try AVAudioPlayer(contentsOf: url)
            normalPlayer?.rate = 2.0
            normalPlayer?.play()
        } catch let error {
             print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "포켓몬배틀1", withExtension: ".mp3") else {
            return
        }
        
        do {
            backgroundPlayer?.enableRate = true
            backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundPlayer?.volume = 0.1
            backgroundPlayer?.rate = 2.0
            backgroundPlayer?.play()
        } catch let error {
             print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }

    func stop() {
        normalPlayer = nil
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer = nil
    }

}

struct SoundEffectView: View {
    
    var soundSetting = SoundSetting()
    
    var body: some View {
        Text("Hello, World!")
    }
}
