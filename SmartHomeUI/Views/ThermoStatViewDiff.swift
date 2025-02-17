//
//  ThermoStatViewDiff.swift
//  SmartHomeUI
//
//  Created by Shashank B on 27/01/25.
//

import SwiftUI

struct ThermoStatViewDiff: View {
    @State private var selectedDevice: String = "Device 1"
    let deviceList: [String] = ["Device 1", "Device 2", "Device 3"]
    var body: some View {
        VStack (spacing:20){
            TemperatureKnobDiff()
                .frame(height: UIScreen.main.bounds.height * 0.45)
            
            
//            weather cards
           SingleWeatherCard()
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
    ThermoStatViewDiff()
}
