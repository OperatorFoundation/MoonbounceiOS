//
//  ContentView.swift
//  MoonbounceiOS
//
//  Created by Jessica Garcia on 5/20/22.
//

import SwiftUI

struct ContentView: View
{
    @State private var serverIP: String = ""
    @State private var port: String = ""
    
    @State private var connectButtonPressed = false
    @State private var buttonTitle = ""
    @State private var ipAddress: String = ""
    
    let configInfoLabel = "Enter Transport Information:"
    let vpn = VPNManager(serverIP: "")
    
    var body: some View
    {
        VStack()
        {
            Text("🌖 Moonbounce 🌔")
                .bold()
                .font(.largeTitle).foregroundColor(Color.black)
            
            VStack(alignment: .leading)
            {
                TextField("Enter VPN Server IP...", text: $serverIP)
                {
                    vpn.serverIP = serverIP
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button("Connect")
            {
                print("Moonbounce: 👆 Connect button tapped.")
                
                if (!self.vpn.manager.isEnabled)
                {
                    print("Moonbounce: calling enable()")
                    self.vpn.enable()
                }
                
                do
                {
                    print("Moonbounce: calling startVPNTunnel")
                    try self.vpn.manager.connection.startVPNTunnel()
                }
                catch
                {
                    print("Moonbounce: Failed to start the tunnel: \(error)")
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
            
            Button("Disconnect")
            {
                print("Moonbounce: 👆 Connect button tapped.")
                
                self.vpn.manager.connection.stopVPNTunnel()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            HStack
            {
                Button("Test TCP")
                {
                    // TODO: TCP Test
                }
                
                Button("Test UDP")
                {
                    // TODO: UDP Test
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
