//
//  ProfileView.swift
//  golf
//
//  Created by Aidan James on 2024-05-22.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var editProfile = false
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CircleImage(pic: modelData.profile.pic)
                if modelData.profile.username.count < 10 {
                    Text(modelData.profile.username)
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                } else if modelData.profile.username.count < 13 {
                    Text(modelData.profile.username)
                        .font(.title2)
                        .bold()
                        .padding(.leading, 10)
                } else {
                    Text(modelData.profile.username)
                        .font(.title3)
                        .bold()
                        .padding(.leading, 10)
                }
                
                Spacer()
            }
            
            Divider()
                .overlay(.white)
                .padding(.bottom, 10)
            
            HStack {
                Text("Notifications: ")
                Spacer()
                Text("\(modelData.profile.notifications ? "On": "Off" )")
            }
            .padding(.bottom, 15)
            
            HStack {
                Text("Handicap: ")
                Spacer()
                Text(modelData.profile.handicap)
            }
            .padding(.bottom, 15)
            
            Spacer()
            }
            .padding(.horizontal, 20)
            .padding()
            .foregroundStyle(.white)
            .font(.title3)
            .bold()
    }
}

struct CircleImage: View {
    var pic: Image
    
    var body: some View {
        pic.resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 8)
            }
    }

#Preview {
    ProfileView()
        .environment(ModelData())
        .background(Gradient(colors: gradientColors))
}
