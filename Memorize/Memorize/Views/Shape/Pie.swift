//
//  Pie.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation
import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = .zero
    let endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = self.startAngle - .radians(.pi/2)
        let endAngle = self.endAngle - .radians(.pi/2)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x + radius * cos(startAngle.radians),
                            y: center.y + radius * sin(startAngle.radians))
        
        var path = Path()
        path.move(to: center) // Starts at center
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: !self.clockwise)
        path.addLine(to: center)
        
        return path
    }
}
