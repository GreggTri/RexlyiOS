//
//  ChatView.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 2/21/23.
//

import SwiftUI

struct ChatView: View {
    
    @State var menuOpened: Bool = false
    @State var chatMessages: [ChatMessageModel] = ChatMessageModel.sampleMessages
    @State var messageText: String = ""
    
    var body: some View {
        ZStack(){
            VStack {
                HStack(alignment: .center, spacing: 0){
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .onTapGesture {
                                self.menuOpened.toggle()
                            }
                    
                        Spacer()
                        Text("Rexly")
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding([.trailing])
                        Spacer()
                }
                ScrollView(){
                    LazyVStack(){
                        ForEach(chatMessages, id: \.id){ message in
                            messageView(message: message)
                            
                        }
                    }
                }
                HStack(){
                    TextField("Send a message", text: $messageText)
                        .padding(.horizontal)
                        .padding(.vertical, 8.0)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(10)
                    Button("Send"){
                        print(messageText)
                        sendMessage(userMessage: messageText)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8.0)
                    .background(.green)
                    .cornerRadius(12)
                }
            }
        }
        .preferredColorScheme(.dark)
        .overlay(
            SideMenuView(width: 220, menuOpened: menuOpened, toggleMenu: toggleMenu)
        )
        
    }
    func messageView(message: ChatMessageModel) -> some View {
        HStack(){
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8.0)
                .background(message.sender == .me ? .green : .gray.opacity(0.3))
                .cornerRadius(16)
            if message.sender == .app {Spacer()}
        }
    }
    func sendMessage(userMessage: String){
        print(userMessage)
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
}

//MARK: Preview
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
