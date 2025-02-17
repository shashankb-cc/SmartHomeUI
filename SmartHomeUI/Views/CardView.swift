//
//  CardView.swift
//  SmartHomeUI
//
//  Created by Shashank B on 22/01/25.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    let place: String
    let noOfDevices: Int
    @State var isOn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 0.45
                        )
                        .clipped()
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height * 0.45
                )
                .clipShape(UnevenRoundedRectangle(
                    topLeadingRadius: 16,
                    topTrailingRadius: 16
                ))
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(place)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.gray)
                        Text("\(noOfDevices) Devices")
                            .font(.footnote)
                            .foregroundStyle(.gray.opacity(0.6))
                    }
                    
                    HStack {
                        Text(isOn ? "ON" : "OFF")
                            .font(.callout)
                            .bold()
                            .foregroundColor(isOn ? .gray : .gray.opacity(0.4))
                        Spacer()
                        Toggle("", isOn: $isOn)
                            .labelsHidden()
                            .tint(.red)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .onTapGesture{}
                        
                    }
                }
                .padding()
            }
            .frame(width: geometry.size.width)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .stroke(.white, lineWidth: 3)
                    .shadow(
                        color: Color.black.opacity(0.1),
                        radius: 10,
                        x: 5,
                        y: 5
                    )
            )
        }
    }
}

#Preview {
    CardView(imageName: "room1", place: "Living Room", noOfDevices: 4, isOn: true)
}
