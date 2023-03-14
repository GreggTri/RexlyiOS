//
//  SignInView.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/4/23.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var LoginVM = LoginViewModel()
    
    var body: some View {
        ZStack(){
            VStack(){
                Image(systemName: "line.fill")
                    .padding(.all)
                HStack(alignment: .center){
                    Text("Sign In")
                        .font(.title)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                
                TextField("Email", text: $LoginVM.email)
                    .background(.gray.opacity(0.2))
                    .padding(.all)
                SecureField("Password", text: $LoginVM.password)
                    .background(.gray.opacity(0.2))
                    .padding(.all)
                Button("Sign In"){
                    LoginVM.login()
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical, 8.0)
                .background(.green)
                .cornerRadius(12)
                Text("Don't have an account?")
                    .padding(.all)
                Text("Create an account here!")
                    .underline()
                    .foregroundColor(.blue)
                    .onTapGesture {
                        
                    }
                Spacer()
            }
        }.preferredColorScheme(.dark)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
