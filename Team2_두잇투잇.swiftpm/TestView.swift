//
//  TestView.swift
//  Team2_두잇투잇
//
//  Created by Celan on 2023/03/30.
//

import SwiftUI
import AVKit

struct VideoView: View {
    let title: String
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if let player {
                VideoPlayer(player: player)
            }
        }
            .onAppear {
                player = .init(url: Bundle.main.url(forResource: title, withExtension: "mp4")!)
                player?.play()
            }
            .onChange(of: title) { newValue in
                if newValue != "novideo" {
                    player = .init(url: Bundle.main.url(forResource: newValue, withExtension: "mp4")!)
                    player?.play()
                } else {
                    player = nil
                }
            }
    }
}
