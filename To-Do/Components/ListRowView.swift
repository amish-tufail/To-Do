//
//  ListRowView.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "")
}
