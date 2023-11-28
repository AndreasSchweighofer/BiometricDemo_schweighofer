//
//  AuthenticationManager.swift
//  BiometricDemo
//
//  Created by Andreas Schweighofer on 27.11.23.
//

import Foundation
import LocalAuthentication

class AuthenticationManager {
    
    let context = LAContext()
    var error: NSError?
    
    func canUseBiometrics() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    func authenticateBiometrics(completion: @escaping (Bool) -> Void) {
        let reason = "Authentifizieren um den Inhalt zu sehen"
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
            DispatchQueue.main.async {
                if success {
                    completion(success)
                } else {
                    if let errorString = error?.localizedDescription {
                        print("Error in biometric policy evaluation: \(errorString)")
                    }
                }
            }
        }
    }
}
