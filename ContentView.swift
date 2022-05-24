//
//  ContentView.swift
//  MoonbounceiOS
//
//  Created by Jessica Garcia on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
                Button("Connect!") { }
                    .accessibilityLabel("Connect")
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
        .navigationTitle("MoonbounceiOS")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
