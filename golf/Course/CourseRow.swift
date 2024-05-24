//
//  CourseRow.swift
//  golf
//
//  Created by Aidan James on 2024-05-23.
//

import SwiftUI

struct CourseRow: View {
    var s: String
    var body: some View {
        HStack {
            Text(s)
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(5)
        .frame(width: .infinity)
        .background(
            RoundedRectangle (cornerRadius: 10)
                .foregroundStyle(.white)
                .opacity(0.25)
                .brightness(-0.4)
        )
        .foregroundStyle(.white)
    }
}

#Preview {
    CourseRow(s: "DEMO - SARNIA-ON")
}
