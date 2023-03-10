//
//  CreateAccountViewModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/10/23.
//

import Foundation
import SwiftUI

class CreateAccountViewModel: ObservableObject {
    @ObservedObject var LoginVM: LoginViewModel
    init(LoginVM: LoginViewModel){
        self.LoginVM = LoginVM
    }
    
    func CreateAccount(){
        
    }
}
