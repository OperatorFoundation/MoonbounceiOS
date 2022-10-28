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
    @State private var ipAddress: String = ""
    @State private var port: String = ""
    @State private var disallow: String = ""
    @State private var exclude: String = ""
    
    let configInfoLabel = "Enter Transport Information:"
    
    var body: some View {
        VStack(alignment: .center, spacing: 15)
        {
            Text("Moonbounce")
                .bold()
                .font(.largeTitle).foregroundColor(Color.black)
                //.padding([.top], 40) //.bottom]
            GroupBox(configInfoLabel)
            {
                TextField("Server IP Address", text: $ipAddress) //Text("IP Address: \(ipAddress)")
                TextField("Server Port Number", text: $port) //Text("Port: \(port)")
                TextField("The App to Disallow", text: $disallow)
                TextField("The Route to Exclude", text: $exclude)
            }
            .padding(40)
                Button("Connect to VPN!")
                {
                    connectPressed()
                }
                .accessibilityLabel("Connect")
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .navigationBarTitleDisplayMode(.inline)
                Button("Test TCP")
                {
                    // do something
                }
                .accessibilityLabel("Connect")
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .navigationBarTitleDisplayMode(.inline)
                Button("Test UDP")
                {
                    // do something
                }
                .accessibilityLabel("Connect")
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .navigationBarTitleDisplayMode(.inline)
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
