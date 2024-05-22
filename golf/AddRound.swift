//
//  AddRound.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI

struct AddRound: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        Text("Hello World")
    }
}

#Preview {
    AddRound()
        .environment(ModelData())
}
