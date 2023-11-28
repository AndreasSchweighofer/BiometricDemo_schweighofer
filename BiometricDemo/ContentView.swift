//
//  ContentView.swift
//  BiometricDemo
//
//  Created by Andreas Schweighofer on 27.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var status = "Gesperrt"
    let authenticationManager = AuthenticationManager()
    
    var body: some View {
        VStack {
            Text(status).padding()
            Button("Anmelden") {
                authenticate()
            }
        }
        .padding()
        .onAppear {
            authenticate()
        }
    }
    
    func authenticate() {
        if authenticationManager.canUseBiometrics() {
            authenticationManager.authenticateBiometrics { success in
                if success {
                    self.status = "Entsperrt"
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}


