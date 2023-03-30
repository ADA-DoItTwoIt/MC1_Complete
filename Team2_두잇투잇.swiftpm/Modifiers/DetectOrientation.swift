//
//  SwiftUIView.swift
//  
//
//  Created by Celan on 2023/03/30.
//

import SwiftUI

struct DetectOrientation: ViewModifier {
    
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                withAnimation {
                    orientation = UIDevice.current.orientation
                }
            }
    }
}

extension View {
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
            modifier(DetectOrientation(orientation: orientation))
        }
}
