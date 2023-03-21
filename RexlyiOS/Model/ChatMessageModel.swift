//
//  ChatMessageModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 2/24/23.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case app
}

extension ChatMessageModel {
    static let sampleMessages = [
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from user", dateCreated: Date(), sender: .me),
        ChatMessageModel(id: UUID().uuidString, content: "sample message from app", dateCreated: Date(), sender: .app)
    ]
}
