//
//  ProfileHost.swift
//  golf
//
//  Created by Aidan James on 2024-05-28.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if editMode?.wrappedValue == .inactive {
                // static profile view
                ProfileView()
            } else {
                // edit mode
                ProfileEdit(profile: $draftProfile)
                    // modifiers below populate the editor w correct profile when user taps "done"
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
            HStack {
                Spacer()
                EditButton()
                    .frame(width: 100, height: 50, alignment: .center)
                    .background(.gradientTop)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title3)
                    .cornerRadius(12)
                    .padding(.bottom, 50)
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                    .frame(width: 100, height: 50, alignment: .center)
                    .background(.gradientTop)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title3)
                    .cornerRadius(12)
                    .padding(.bottom, 50)
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
        .background(Gradient(colors: gradientColors))
}

