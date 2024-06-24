//
//  MessagesViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 10/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MessageViewModel : ObservableObject {
    @Published var isLoading = false
    @Published var contacts: [Contact] = []
    
    private let repo : MessageRepository
    
    init(repo: MessageRepository) {
        self.repo = repo
    }
    
    func getContacts() {
        repo.getContacts { contacts in
            self.contacts.removeAll()
            self.contacts = contacts
        }
    }
    
    func logout() {
        repo.logout()
    }
}
