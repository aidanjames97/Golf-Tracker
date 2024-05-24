//
//  ProfileView.swift
//  golf
//
//  Created by Aidan James on 2024-05-22.
//

import SwiftUI

struct ProfileView: View {
    @Environment(ModelData.self) var modelData
    
    private var tmpBest = 66
    private var tmpBestPar = 72
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CircleImage(pic: modelData.profile.pic)
                Text(modelData.profile.username)
                    .font(.title)
                    .bold()
                    .padding(.leading, 10)
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
            
            HStack {
                Text("Best Round: ")
                Spacer()
                Text("\(tmpBest) (\(tmpBest-tmpBestPar))")
            }
                
            Spacer()
        
            HStack(alignment: .center) {
                Spacer()
                Button {
                    
                } label: {
                    Text("Edit")
                }
                .frame(width: 100, height: 50, alignment: .center)
                .background(.gradientTop)
                .cornerRadius(12)
                .padding(.bottom, 50)
                Spacer()
            }
        }
        .padding(.horizontal, 25)
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
                .shadow(radius: 50)
            }
    }

#Preview {
    ProfileView()
        .environment(ModelData())
        .background(Gradient(colors: gradientColors))
}
