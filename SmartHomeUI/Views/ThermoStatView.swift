//
//  ThermoStatView.swift
//  SmartHomeUI
//
//  Created by Shashank B on 23/01/25.
//

import SwiftUI

struct ThermoStatView: View {
    @State private var selectedDevice: String = "Device 1"
    let deviceList: [String] = ["Device 1", "Device 2", "Device 3"]

    var body: some View {
        VStack (spacing:20){
            TemperatureKnob()
                .frame(height: UIScreen.main.bounds.height * 0.35)
            
            Menu {
                Button("Device 1", action: { selectedDevice = "Device 1" })
                Button("Device 2", action: { selectedDevice = "Device 2" })
                Button("Device 3", action: { selectedDevice = "Device 3" })
            } label: {
                HStack {
                    Text(selectedDevice)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.6,height:UIScreen.main.bounds.width * 0.12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.black.opacity(0.2), lineWidth: 1)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                        .mask(RoundedRectangle(cornerRadius: 50))
                )
            }
            
//            weather cards
            HStack (spacing:10) {
                WeatherCardView(imageName: "humidity.fill", weatherDescription: "Inside Hunidity", weatherValue: "49 %", background: AnyView(Color(rgb: (255, 218, 218))))
                WeatherCardView(imageName: "thermometer.medium", weatherDescription: "Outside temps.", weatherValue: "-10°", background: AnyView(LinearGradient(colors: [Color(rgb: (237, 231, 246)),Color(rgb: (255, 218, 218))], startPoint: .top, endPoint: .bottom)))
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            //mode buttons
            HStack(spacing: 20) {
                ThermostatButton(label: "MODE", systemImage: "wind")
                ThermostatButton(label: "ECO", systemImage: "leaf")
                ThermostatButton(label: "SCHEDULE", systemImage: "flame.fill")
                ThermostatButton(label: "HISTORY", systemImage: "timer")
               
            }
        }
        .padding()
        .navigationTitle("Thermostat")
        
    }
}

#Preview {
    ThermoStatView()
}
