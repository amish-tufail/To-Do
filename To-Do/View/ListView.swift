//
//  ListView.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.count == 0 {
                NoItemsView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: { indexSet in
                        listViewModel.onDelete(indexSet: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listViewModel.onMove(indices: newOffset, newOffset: indices)
                    })
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Tody 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
            .environment(ListViewModel())
    }
}
