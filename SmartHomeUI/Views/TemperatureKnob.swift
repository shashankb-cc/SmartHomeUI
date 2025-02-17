//
//  TemperatureKnob.swift
//  SmartHomeUI
//
//  Created by Shashank B on 24/01/25.
//

import SwiftUI


struct TemperatureKnob: View {
    
    @State private var trimValue: CGFloat = 0.2
    @State private var heatValue: Int = 20
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack {
            
            Circle()
                .trim(from: 0, to: 0.51)
                .stroke(style: StrokeStyle(lineWidth: 15,dash: [2,20]))
                .rotationEffect(.degrees(180))
                .foregroundStyle(.gray.opacity(0.7))
               .frame(width: screenWidth * 0.62)
            
            Circle()
                .frame(width: screenWidth * 0.57)
                .foregroundStyle(LinearGradient(colors: [.gray.opacity(0.2), .blue.opacity(0.1)], startPoint: .topLeading, endPoint: .topTrailing))
            
            Circle()
                .trim(from: 0, to: trimValue)
                .stroke(
                    style: StrokeStyle(lineWidth: screenWidth * 0.07, lineCap: .round)
                )
                .frame(width: screenWidth * 0.43)
                .foregroundStyle(LinearGradient(colors: [.purple.opacity(0.9), .pink.opacity(0.7)], startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(120))
            
            Circle()
                .fill(.white)
                .frame(width: screenWidth * 0.44)
            
            Circle()
                .stroke(Color.gray.opacity(0.17))
                .fill(LinearGradient(colors: [.gray.opacity(0.2), .white], startPoint: .topLeading, endPoint: .topTrailing))
                .frame(width: screenWidth * 0.37)
            
            VStack {
                
                //button to move the pink and purple gradient
                Circle()
                    .fill(LinearGradient(colors: [.gray.opacity(0.4), .white], startPoint: .top, endPoint: .bottom))
                    .frame(width: screenWidth * 0.04)
                    .offset(x: screenWidth * 0.1)
                
                Text("HEATING")
                    .font(.system(size: screenWidth * 0.05))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
                Text("\(heatValue)")
                    .font(.system(size: screenWidth * 0.1))
                    .foregroundStyle(.gray.opacity(0.7))
                
                // Leaf icon
                Group {
                    if heatValue < 15 {
                        Image(systemName: "snowflake")
                            .foregroundStyle(.blue)
                            .font(.system(size: screenWidth * 0.06))
                    } else if heatValue > 40 {
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.red)
                            .font(.system(size: screenWidth * 0.06))
                    } else {
                        Image(systemName: "leaf.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: screenWidth * 0.06))
                    }
                }

            }
        }
//        Button("+") {
//            print(trimValue)
//            heatValue += 2
//            trimValue += 0.0195
//        }
//        .disabled(heatValue == 100)
//        Button("-") {
//            trimValue -= 0.0195
//            heatValue -= 2
//        }
//        .disabled(heatValue == 0)
    }
}

#Preview {
    TemperatureKnob()
}




