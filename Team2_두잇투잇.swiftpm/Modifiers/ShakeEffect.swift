//
//  ShakeEffect.swift
//  partTest
//
//  Created by Celan on 2023/03/29.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 8
    var shakesPerUnit = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX:
                    amount * sin(
                        animatableData * .pi * CGFloat(shakesPerUnit)
                    ),
                y: 0
            )
        )
    }
}
