//
//  To_DoApp.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

@main
struct To_DoApp: App {
    @State private var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environment(listViewModel)
        }
    }
}
