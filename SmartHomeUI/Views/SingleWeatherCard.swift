//
//  SingleWeatherCard.swift
//  SmartHomeUI
//
//  Created by Shashank B on 27/01/25.
//

import SwiftUI

struct SingleWeatherCard: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(spacing: screenHeight * 0.03) {
            WeatherDetail(imageName: "humidity.fill", headingText: "Inside Humidity", valueText: "49 %")
            WeatherDetail(imageName: "thermometer.medium", headingText: "Outside temps.", valueText: "-10 C")
        }
        .padding(.horizontal, screenWidth * 0.06)
        .padding(.vertical, screenHeight * 0.03)
        .background(
            RoundedRectangle(cornerRadius:30)
                .fill(Color.white)
                .stroke(Color.white, lineWidth: 2)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
        )
    }
}

struct WeatherDetail: View {
    let imageName: String
    let headingText: String
    let valueText: String
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        HStack(spacing: screenWidth * 0.02) {
            Image(systemName: imageName)
                .scaledToFit()
                .frame(width: screenWidth * 0.08, height: screenWidth * 0.08)
                .padding(screenWidth * 0.03)
                .foregroundStyle(.gray.opacity(0.7))
                .background(
                    LinearGradient(
                        colors: [.gray.opacity(0.33), .white],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(Circle())
            
            Text(headingText)
                .foregroundStyle(.gray)
                .fontWeight(.bold)
            Spacer()
            Text(valueText)
                .foregroundStyle(.gray)
        }
        .font(.title3)
    }
}

#Preview {
    SingleWeatherCard()
}

