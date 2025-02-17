//
//  TemperatureKnobDiff.swift
//  SmartHomeUI
//
//  Created by Shashank B on 27/01/25.
//

import SwiftUI

struct TemperatureKnobDiff: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.gray.opacity(0.4),.blue.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                .frame(width: screenWidth * 0.8)
            Circle()
                .fill(.white)
                .frame(width: screenWidth * 0.72)
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.gray.opacity(0.4), .black.opacity(1)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: screenWidth * 0.65)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
            Circle()
                .fill(LinearGradient(colors: [.purple.opacity(0.9),.pink.opacity(0.9)], startPoint: .top, endPoint: .bottom))
                .frame(width: screenWidth * 0.54)
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(style: StrokeStyle(lineWidth: 20,dash: [1,10]))
                .rotationEffect(.degrees(130))
                .foregroundStyle(.white.opacity(0.5))
               .frame(width: screenWidth * 0.45)
            
            Circle()
                .trim(from: 0.1, to: 0.105)
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 25)
                )
                .rotationEffect(.degrees(250))
                .frame(width: screenWidth * 0.45)

            
            VStack {
//                Circle()
//                    .fill(LinearGradient(colors: [.gray.opacity(0.3), .white], startPoint: .top, endPoint: .bottom))
//                    .frame(width: screenWidth * 0.04)
//                    .offset(x: screenWidth * 0.1)
//                
                Text("HEATING")
                    .font(.system(size: screenWidth * 0.05))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("22")
                    .font(.system(size: screenWidth * 0.12))
                    .foregroundStyle(.white)
                
                // Leaf icon
                Image(systemName: "leaf.fill")
                    .foregroundStyle(.green)
                    .font(.system(size: screenWidth * 0.06))
                    .fontWeight(.black)
            }
               
        }
    }
}

#Preview {
    TemperatureKnobDiff()
}
