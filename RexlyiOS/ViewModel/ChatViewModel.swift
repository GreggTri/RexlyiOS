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
    var userMessage: String = ""
    init(LoginVM: LoginViewModel){
        self.LoginVM = LoginVM
    }
    
    func chat(){
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "JWT") else {
            LoginVM.logout()
            return
        }
        WebService().chat(token: token, userMessage: userMessage) { result in
            switch result {
            case .success(let response):
                print(response)
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
