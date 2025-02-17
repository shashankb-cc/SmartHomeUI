
//  ContentView.swift
//  SmartHomeUI
//
//  Created by Shashank B on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption:String = "Room"
    let options:[String] =  ["Room","Devices"]
    let rooms: [Room] = [
        Room(imageName: "room1", place: "Living Room", noOfDevices: 4, isOn: true),
        Room(imageName: "room2", place: "Master Bedroom", noOfDevices: 6, isOn: false),
        Room(imageName: "room3", place: "Kitchen", noOfDevices: 3, isOn: true),
        Room(imageName: "room4", place: "Guest Bedroom", noOfDevices: 2, isOn: false),
        Room(imageName: "room5", place: "Bathroom", noOfDevices: 1, isOn: true),
        Room(imageName: "room6", place: "Study Room", noOfDevices: 5, isOn: false)
    ]
    
    let devices: [Device] = [
          
           Device(imageName: "Washing Machine", place: "Hall", isOn: true),
           Device(imageName: "Oven", place: "Kitchen", isOn: true),
           Device(imageName: "Washing Machine", place: "Balcony", isOn: true),
       ]
       
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in 
                VStack (spacing:10) {
                    
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                                )
                                .shadow(color: Color(red: 0.82, green: 0.82, blue: 0.82), radius: 8, x: 8, y: 8)
                        })
                    }
                    .padding([.horizontal,.top])
                    
                    //family details
                    
                    HStack {
                        Text("Family Members")
                            .font(.title2)
                            .foregroundStyle(.gray)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        OverLappingAvatars()
                        
                    }
                    .padding()
                    
                    //weather details
                    
                    WeatherView()
                        .padding(.horizontal)
                    
                    //Stepper for room and devices
                    Picker("Select a option", selection: $selectedOption) {
                        ForEach(options,id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    //room and deviced view
                    
                    ScrollView {
                        let cardWidth = (geometry.size.width - 60) / 2
                        
                        if selectedOption == "Room" {
                            LazyVGrid(
                                columns: [
                                    GridItem(.fixed(cardWidth), spacing: 10),
                                    GridItem(.fixed(cardWidth), spacing: 10)
                                ],
                                spacing: 20
                            ) {
                                ForEach(rooms) { room in
                                    NavigationLink(destination: ThermoStatViewDiff()) {
                                        CardView(imageName: room.imageName, place: room.place, noOfDevices: room.noOfDevices, isOn: room.isOn)
                                            .frame(width: cardWidth, height: geometry.size.height * 0.35)
                                    }
                                }
                            }
                        } else if selectedOption == "Devices" {
                            LazyVGrid(
                                columns: [
                                    GridItem(.fixed(cardWidth), spacing: 10),
                                    GridItem(.fixed(cardWidth), spacing: 10)
                                ],
                                spacing: 20
                            ) {
                                ForEach(devices) { room in
                                    NavigationLink(destination: ThermoStatView()) {
                                        CardView(imageName: room.imageName, place: room.place, noOfDevices: 1, isOn: room.isOn)
                                            .frame(width: cardWidth, height: geometry.size.height * 0.35)
                                    }
                                }
                            }
                        }
                    }
                    FooterSection()
                    
                }
//                .toolbar{
//                    ToolbarItem(placement:.topBarLeading){
//                        Text("Home")
//                            .font(.largeTitle)
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    }
//                    ToolbarItem(placement:.topBarTrailing){
//                        Button(action: {}, label: {
//                            Image(systemName: "gearshape")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 20, height: 20)
//                                .foregroundStyle(.gray)
//                                .padding(10)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
//                                )
//                                .shadow(color: Color(red: 0.82, green: 0.82, blue: 0.82), radius: 8, x: 8, y: 8)
//                        })
//                    }
//                }
//                .padding(10)
                .ignoresSafeArea(edges:.bottom)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherView: View {
    var body: some View {
        VStack(spacing:5) {
            
            HStack{
                VStack (alignment:.leading){
                    Text("My Location")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Montreal")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                }
                Spacer()
                Text("-10°")
                    .font(.system(size: 50))
                    
            }
            .foregroundStyle(.white)
            
            HStack(){
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.callout)
                Spacer()
            }
            
            
            HStack{
                Image(systemName: "cloud.sun.fill")
                    .foregroundStyle(.white)
                Text("Partly Cloudy")
                Spacer()
                Text("H:2° L:12°")
            }
            .font(.callout)
            .foregroundStyle(.white.opacity(0.6))
            
        }
        .padding(10)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(colors: [.purple.opacity(0.9),.pink.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
        .clipShape(.rect(cornerRadius: 20))
        
    }
}
