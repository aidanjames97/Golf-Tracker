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
    @State private var showAlert = false
    
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
                        if(!draftProfile.username.isEmpty && draftProfile.username.count < 30) {
                            modelData.profile = draftProfile
                        } else {
                            showAlert = true
                        }
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
                
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Invalid Username"),
                            message: Text("Username cannot be blank nor be longer than 30 characters")
                        )
                    }

                
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

