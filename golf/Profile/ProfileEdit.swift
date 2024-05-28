//
//  ProfileEdit.swift
//  golf
//
//  Created by Aidan James on 2024-05-28.
//

import SwiftUI

struct ProfileEdit: View {
    @Environment(ModelData.self) var modelData
    @Binding var profile: Profile
    @State private var done = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Username:")
                Spacer()
                TextField(modelData.profile.username, text: $profile.username)
                    .multilineTextAlignment(.trailing)
                    .autocorrectionDisabled()
            }
            .padding(.bottom, -5)
            Divider()
                .overlay(.white)
                .padding(.bottom, 10)
            HStack {
                Text("Image:")
                Spacer()
                Text("PASTEABLE IMAGE??")
            }
            .padding(.bottom, -5)
            Divider()
                .overlay(.white)
                .padding(.bottom, 10)
            Toggle(isOn: $profile.notifications) {
                Text("Enable Notifications")
            }
            .padding(.bottom, -5)
            Divider()
                .overlay(.white)
                .padding(.bottom, 10)
            Spacer()
        }
        .padding(.horizontal, 25)
        .padding()
        .foregroundStyle(.white)
        .font(.title3)
        .bold()
    }
}

#Preview {
    ProfileEdit(profile: .constant(.default))
        .environment(ModelData())
        .background(Gradient(colors: gradientColors))
}
