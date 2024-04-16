//
//  AddView.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ListViewModel.self) var listViewModel
    @State private var text: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55.0)
                    .background(.gray.opacity(0.25))
                    .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
                Button {
                    saveButtonPressed()
                   
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55.0)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
                }
            }
            .padding(14.0)
        }
        .navigationTitle("Add an Item ✍️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: text)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if text.count < 3 {
            alertTitle = "Your new tody must be at least 3 characters long 😞."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddView()
            .environment(ListViewModel())
    }
}
