//
//  WeatherCardView.swift
//  SmartHomeUI
//
//  Created by Shashank B on 23/01/25.
//

import SwiftUI

struct WeatherCardView: View {
    let imageName: String
    let weatherDescription: String
    let weatherValue: String
    let background:AnyView
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let horizontalPadding = screenWidth * 0.03
        let verticalPadding = screenWidth * 0.04
        VStack(spacing:10) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.width * 0.05)
                .padding(UIScreen.main.bounds.width * 0.04)
                .font(.title)
                .foregroundStyle(LinearGradient(colors: [.purple.opacity(0.5),.pink.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                .background(background)
            
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            
                Text(weatherDescription)
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(weatherValue)
                .font(.system(size: UIScreen.main.bounds.width * 0.055))
                    .foregroundStyle(.gray)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .fontDesign(.rounded)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width )
        .padding(.vertical, verticalPadding) // Top and Bottom padding = 10
        .padding(.horizontal, horizontalPadding) // Left and Right padding = 5
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 10)
                
        )
        
        
        
        
    }
}

extension Color {
    init(rgb: (Int, Int, Int)) {
        self.init(red: Double(rgb.0) / 255.0, green: Double(rgb.1) / 255.0, blue: Double(rgb.2) / 255.0)
    }
}
//#Preview {
//    WeatherCardView(imageName: "humidity.fill", weatherDescription: "Inside Humidity", weatherValue: "49 %", background: AnyView(Color(rgb: (255, 218, 218))))
//    
//}

#Preview {
    HStack(spacing: 5) { // HStack to align cards horizontally with a 15-point gap
        WeatherCardView(
            imageName: "humidity.fill",
            weatherDescription: "Inside Humidity",
            weatherValue: "49 %",
            background: AnyView(Color(rgb: (255, 218, 218)))
        )
        WeatherCardView(
            imageName: "thermometer.medium",
            weatherDescription: "Outside Temps",
            weatherValue: "24°C",
            background: AnyView(Color(rgb: (237, 231, 246)))
        )
    }
    .frame(maxWidth: .infinity) // Ensure the cards take up the available width
//    .padding() // Add padding around the HStack for better layout
}

