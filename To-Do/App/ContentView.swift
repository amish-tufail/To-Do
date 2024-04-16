//
//  ContentView.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView()
    }
}

#Preview {
    ContentView()
        .environment(ListViewModel())
}
