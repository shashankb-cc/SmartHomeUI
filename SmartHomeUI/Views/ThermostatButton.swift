//
//  ThermostatButton.swift
//  SmartHomeUI
//
//  Created by Shashank B on 24/01/25.
//

import SwiftUI

struct ThermostatButton: View {
    @State private var isSelected: Bool = false
    
    var label: String
    var systemImage: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.gray.opacity(0.4),.white],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: .gray.opacity(isSelected ? 0.2 : 0.1), radius: 2, x: 0, y: 4)
                    .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                
                Circle()
                    .fill(
                        isSelected ?
                            LinearGradient(
                                colors: [Color.purple.opacity(0.7), Color.pink.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            : LinearGradient(
                                colors: [.white],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                    )
                    .shadow(color: .gray.opacity(isSelected ? 0.2 : 0.1), radius: 6, x: 0, y: 4)
                    .frame(width: UIScreen.main.bounds.width * 0.14, height: UIScreen.main.bounds.width * 0.14)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: isSelected ?
                                [Color.purple, Color.pink] :
                                [Color.white.opacity(0.9), Color.gray.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .stroke(isSelected ? Color.white.opacity(0.5) : Color.gray.opacity(0.1), lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width * 0.12, height: UIScreen.main.bounds.width * 0.12)
                
                
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.width * 0.06)
                    .foregroundStyle(isSelected ? .white : .gray.opacity(0.6))
            }
            
            Text(label)
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor( .gray.opacity(0.6))
        }
        .onTapGesture {
            isSelected.toggle()
        }
        .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    HStack(spacing: 10) {
        ThermostatButton(label: "MODE", systemImage: "wind")
        ThermostatButton(label: "HEAT", systemImage: "flame.fill")
        ThermostatButton(label: "COOL", systemImage: "snowflake")
        ThermostatButton(label: "ECO", systemImage: "leaf")
    }
    
}


