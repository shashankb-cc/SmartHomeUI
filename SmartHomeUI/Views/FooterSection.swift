//
//  FooterSection.swift
//  SmartHomeUI
//
//  Created by Shashank B on 23/01/25.
//

import SwiftUI

struct FooterSection: View {
    var body: some View {
        HStack {
            Image(systemName: "house")
            Spacer()
            ZStack {
                Circle()
                    .fill(.white.opacity(0.8))
                    .frame(height: UIScreen.main.bounds.height * 0.14)
                Circle()
                    .fill(.white)
                    .frame(height: UIScreen.main.bounds.height * 0.09)
                Circle()
                    .fill(.gray.opacity(0.1))
                    .frame(height: UIScreen.main.bounds.height * 0.07)
                Image(systemName: "mic")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(colors: [.purple,.pink], startPoint: .top, endPoint: .bottom))
                    .padding()
            }
            .offset(y:-25)
            
            Spacer()
            Image(systemName: "person")
        }
        .frame(height: UIScreen.main.bounds.height * 0.08)
        .font(.largeTitle)
        .padding()
        .padding(.horizontal,30)
        .foregroundStyle(.white)
        .background(LinearGradient(colors: [Color(red: 43/255, green: 47/255, blue: 62/255,opacity: 0.8),Color(red: 43/255, green: 47/255, blue: 62/255)], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    FooterSection()
}
