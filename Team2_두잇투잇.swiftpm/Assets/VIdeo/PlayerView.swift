//
//  1.swift
//  partTest
//
//  Created by 주환 on 2023/03/29.
//
import SwiftUI
import AVFoundation
import AVKit



struct BackgroundVideoView: View {
    @Binding var videoName: String
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                PlayerView(videoName: $videoName)
            }
        }
    }
}




struct PlayerView: UIViewRepresentable {
    @Binding var videoName: String
    
    func makeUIView(context: Context) -> LoopingPlayerUIView {
        LoopingPlayerUIView(frame: .zero, videoName: videoName)
    }
    
    func updateUIView(_ uiView: LoopingPlayerUIView, context: Context) {
        uiView.playerLooper = nil
        uiView.videoName = videoName
    }
    
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
//
//    }
//
//    func makeUIView(context: Context) -> UIView {
//        return LoopingPlayerUIView(
//            frame: .zero,
//            videoName: videoName
//        )
//    }
}
