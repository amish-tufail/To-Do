//
//  ListRowView.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.body)
        .padding(.vertical, 4.0)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "", isCompleted: false))
}
