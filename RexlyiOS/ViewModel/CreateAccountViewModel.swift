//
//  CreateAccountViewModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/10/23.
//

import Foundation
import SwiftUI

class CreateAccountViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    
    @ObservedObject var LoginVM: LoginViewModel
    
    init(LoginVM: LoginViewModel){
        self.LoginVM = LoginVM
    }
    
    func CreateAccount(){
        let defaults = UserDefaults.standard
        
        WebService().createAccount(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "JWT")
                DispatchQueue.main.async {
                    self.LoginVM.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
