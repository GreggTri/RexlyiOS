//
//  ChatViewModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/9/23.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @ObservedObject var LoginVM: LoginViewModel
    var message: String = ""
    init(LoginVM: LoginViewModel){
        self.LoginVM = LoginVM
    }
    
    func chat(){
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "JWT") else {
            LoginVM.logout()
            return
        }
        WebService().chat(token: token, userMessage: message) { result in
            switch result {
            case .success(let response):
                print(response)
                //TODO: Still need to actually grab user message while also displaying that message and then work here to then post new bot message with products in applicable
                
                
            case .failure(let error):
                switch error {
                case .invalidCredentials:
                    self.LoginVM.logout()
                default:
                    print("An error occurred")
                }
            }
        }
    }
}
