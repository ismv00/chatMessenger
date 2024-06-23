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
    
    func getContacts() {
        let fromId = Auth.auth().currentUser!.uid
        Firestore.firestore().collection("last-messages")
            .document(fromId)
            .collection("contacts")
            .addSnapshotListener { snapshot, error in
                if let changes  = snapshot?.documentChanges {
                    for doc in changes {
                        if doc.type == .added {
                            let document = doc.document
                            
                            self.contacts.removeAll()
                            self.contacts.append(Contact(uuid: document.documentID, 
                                                         name: document.data()["username"] as! String,
                                                         profileUrl: document.data()["photoUrl"] as! String,
                                                         lastMessage: document.data()["lastMessage"] as! String,
                                                         timestamp: document.data()["timestamp"] as! UInt))
                        }
                    }
                }
            }
        
        
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}