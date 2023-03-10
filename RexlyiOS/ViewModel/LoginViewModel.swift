//
//  AuthViewModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/4/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    
    @Published var isAuthenticated: Bool = false
    
    func login(){
        
        let defaults = UserDefaults.standard
        
        WebService().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "JWT")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func logout() {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "JWT")
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}





