//
//  RoomModel.swift
//  SmartHomeUI
//
//  Created by Shashank B on 22/01/25.
//

import Foundation

struct Room :Identifiable{
    let id = UUID()
    let imageName: String
    let place: String
    let noOfDevices: Int
    var isOn: Bool
}

struct Device :Identifiable{
    let id = UUID()
    let imageName: String
    let place: String
    var isOn: Bool
}
