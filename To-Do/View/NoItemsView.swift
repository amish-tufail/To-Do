//
//  NoItemsView.swift
//  To-Do
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your tody list!")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🤪")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55.0)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.secondaryAccent : Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
                }
                .padding(.horizontal, animate ? 30.0 : 50.0)
                .shadow(color: animate ? Color.secondaryAccent.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30.0 : 10.0, x: 0.0, y: animate ? 50.0 : 30.0)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0.0)
            }
            .frame(maxWidth: 400.0)
            .multilineTextAlignment(.center)
            .padding(40.0)
            .onAppear(perform: {
                addAnimation()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollIndicators(.never)
    }
}

extension NoItemsView {
    private func addAnimation() {
        guard !animate else { return } // Make sures that animation doesn't get called twice
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
    }
}
