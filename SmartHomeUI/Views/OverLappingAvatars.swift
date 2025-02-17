//
//  OverLappingAvatars.swift
//  SmartHomeUI
//
//  Created by Shashank B on 22/01/25.
//

import SwiftUI

struct OverLappingAvatars: View {
    
    private let avatars: [String] = [
        "person1",
        "person2",
        "person3",
        "person4",
        "person5"
        
        
    ]
    private let avatarSize: CGFloat = 35
    private let overlapOffset: CGFloat = 0.25
    
    var body: some View {
        HStack(spacing: -avatarSize * overlapOffset) {
            ForEach(avatars.indices, id: \.self) { index in
                Image(avatars[index])
                    .resizable()
                    .scaledToFill()
                    .frame(width: avatarSize, height: avatarSize)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .background(Circle().fill(Color.white))
                    .zIndex(Double(avatars.count - index))
            }
        }
        
    }
}

#Preview {
    OverLappingAvatars()
}
