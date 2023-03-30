//
//  2.swift
//  partTest
//
//  Created by 주환 on 2023/03/29.
//

import SwiftUI
import AVKit
import AVFoundation

final class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    public var playerLooper: AVPlayerLooper?
    public var videoName: String?
    
    init(frame: CGRect, videoName: String) {
        super.init(frame: frame)
        self.videoName = videoName + ".mp4"
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else {
            fatalError()
        }
        let item = AVPlayerItem(url: url)
        item.seekingWaitsForVideoCompositionRendering = true

        let player = AVQueuePlayer(playerItem: item)
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.isMuted = true
        player.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

