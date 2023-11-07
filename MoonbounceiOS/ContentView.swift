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
    
    @State private var ipAddress: String = ""
    
    @State private var connectToVPN =  false
    
    let configInfoLabel = "Enter Transport Information:"
    let vpn = VPNManager(serverIP: "", port: "")
    
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
                TextField("Enter Port", text: $port)
                {
                    vpn.port = port
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack
            {
                Spacer()
                Text("Connect to VPN")
                Toggle("", isOn: self.$connectToVPN).onChange(of: connectToVPN)
                { 
                    vpnConnected in
                    
                        if vpnConnected
                        {
                            print("Moonbounce: 👆 Connect switch tapped.")
                            
                            if (!self.vpn.manager.isEnabled)
                            {
                                print("Moonbounce: calling enable()")
                                self.vpn.enable()
                            }
                            
                            do
                            {
                                try self.vpn.manager.connection.startVPNTunnel()
                                print("Moonbounce: calling startVPNTunnel")
                            }
                            catch
                            {
                                print("Moonbounce: Failed to start the tunnel: \(error)")
                            }
                        }
                        else
                        {
                            print("Moonbounce: 👆 Disconnect switch tapped.")
                            
                            self.vpn.manager.connection.stopVPNTunnel()
                        }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.indigo))
                .labelsHidden()
                Spacer()
            }
            
            HStack
            {
                Button("Test TCP")
                {
                    // TODO: TCP Test
                    print("Test TCP Tapped.")
                }
                
                Button("Test UDP")
                {
                    // TODO: UDP Test
                    print("Test UDP Tapped.")
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
