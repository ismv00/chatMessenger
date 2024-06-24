//
//  ChatViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 12/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ChatViewModel : ObservableObject {
    @Published var messages: [Message] = []
    @Published var text = ""
    
    var newCount = 0
    let limit = 20
    
    private let repo: ChatRepository
    
    init(repo: ChatRepository) {
        self.repo = repo
    }
    
    func onAppear(contact: Contact) {
        repo.fetchChat(limit: limit, contact: contact, lastMessage: self.messages.last) { messages, newCount in
            self.messages.append(contentsOf: messages)
            self.newCount = newCount
        }
    }
    
    func sendMessage(contact: Contact) {
        let text = self.text.trimmingCharacters(in: .whitespacesAndNewlines)
        self.text = ""
        newCount = newCount + 1
        
        repo.sendMessage(inserting: true,text: text, contact: contact)

    }
    
    
}
