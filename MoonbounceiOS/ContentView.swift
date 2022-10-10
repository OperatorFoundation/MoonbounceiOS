//
//  ContentView.swift
//  MoonbounceiOS
//
//  Created by Jessica Garcia on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var connectButtonPressed = false
    @State private var buttonTitle = ""
    
    var body: some View {
        NavigationView {
                Button("Connect!") {
                    connectPressed()
                }
                    .accessibilityLabel("Connect")
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
        .navigationTitle("MoonbounceiOS")
        .navigationBarTitleDisplayMode(.inline)
        }
        .alert(buttonTitle, isPresented: $connectButtonPressed) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text("Connect Button Pressed!")
        }
    }
    
    func connectPressed() {
        connectButtonPressed = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
