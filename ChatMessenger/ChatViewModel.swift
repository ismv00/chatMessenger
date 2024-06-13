//
//  ChatViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 12/06/24.
//

import Foundation

class ChatViewModel : ObservableObject {
    @Published var messages: [Message] = [
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: false),
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: false),
        Message(uuid: UUID().uuidString, text: "outra mensagem", isMe: true),
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: false),
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: true),
        Message(uuid: UUID().uuidString, text: "mais uma mensagem", isMe: false),
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: true),
        Message(uuid: UUID().uuidString, text: "sempre a mesma mensagem", isMe: false),
        Message(uuid: UUID().uuidString, text: "Alguma mensagem", isMe: false),
        
    ]
    
    @Published var text = ""
}
