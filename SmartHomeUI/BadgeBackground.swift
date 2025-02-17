//
//  BadgeBackground.swift
//  SmartHomeUI
//
//  Created by Shashank B on 27/01/25.
//

//import SwiftUI
//
//struct Triangle:Shape {
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        }
//    }
//}
//
//struct Diamond:Shape{
//    func path(in rect: CGRect) -> Path {
//        Path {path in
//            let horizontalOffset = rect.width * 0.2
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        }
//    }
//}
//
//struct BadgeBackground: View {
//    var body: some View {
//        Diamond()
//            .frame(width: 300,height: 300)
//    }
//}
//
//#Preview {
//    BadgeBackground()
//}
import SwiftUI

struct CurveShape: View {
    var body: some View {
        Curve()
            .fill(Color.gray)
            .rotationEffect(.degrees(-90))
        
        
        
    }
    
}

struct Curve: Shape {
    let largeRadius: CGFloat = 200
    func path(in rect: CGRect) -> Path {
        
        // Define all the points we're going to use
        let upperLeft = CGPoint.zero
        let upperRight = CGPoint(x: rect.maxX, y: rect.minY)
//        let midTop = CGPoint(x: rect.midX, y: rect.minY)
        
        // The "midRight" and "midLeft" points are the points where the large radius curves are centered.
        let midRight = CGPoint(x: rect.maxX, y: rect.maxY - largeRadius * 2)
        let midLeft = CGPoint(x: rect.minX, y: rect.maxY - largeRadius * 2)

        // The bottom left is the lowest point on the shape.
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

        var path = Path()
        
        // Start from upperLeft instead of midTop to avoid the cut
        path.move(to: upperLeft)
        
        // Draw a straight line to upperRight
        path.addLine(to: upperRight)
        
        // Draw a large radius curve around the mid right, headed to the mid-left
        path.addArc(tangent1End: midRight, tangent2End: midLeft, radius: largeRadius, transform: .identity)

        // Now draw an outside curve down to the bottom left corner
        path.addArc(tangent1End: midLeft, tangent2End: bottomLeft, radius: largeRadius, transform: .identity)
        
        // Now draw a final curve back to the start point
//        path.addArc(tangent1End: upperLeft, tangent2End: upperLeft, radius: smallRadius, transform: .identity)
            
        
//        path.closeSubpath()
        return path
    }
}

#Preview {
    CurveShape()
}
