//
//  CreateAccountVIew.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/4/23.
//

import SwiftUI

struct CreateAccountVIew: View {
    
    @StateObject private var createAccountVM = CreateAccountViewModel(LoginVM: LoginViewModel())
    
    var body: some View {
        ZStack(){
            VStack(){
                Image(systemName: "line.fill")
                    .padding(.all)
                HStack(alignment: .center){
                    Text("Create Account")
                        .font(.title)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                TextField("Email", text: $createAccountVM.email)
                    .background(.gray.opacity(0.2))
                    .padding(.all)
                SecureField("Password", text: $createAccountVM.password)
                    .background(.gray.opacity(0.2))
                    .padding(.all)
                Button("Create Account"){
                    createAccountVM.CreateAccount()
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical, 8.0)
                .background(.green)
                .cornerRadius(12)
                Text("Already have an account?")
                    .padding(.all)
                Text("Sign In Here!")
                    .underline()
                    .foregroundColor(.blue)
                    .onTapGesture {
                        
                    }
                
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct CreateAccountVIew_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountVIew()
    }
}
