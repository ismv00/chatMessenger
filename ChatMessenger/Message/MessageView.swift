//
//  MessagesView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 10/06/24.
//

import SwiftUI

struct MessageView: View {
    @StateObject var viewModel = MessageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                List(viewModel.contacts, id: \.self) { contact in
                    NavigationLink{
                        ChatView(contact: contact)
                    } label: {
                        ContactMessageRow(contact: contact)
                    }
                }
            }
            .onAppear {
                viewModel.getContacts()
            }
            .navigationTitle("Mensagens")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Contatos", destination: ContactView())
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Logout") {
                        viewModel.logout()
                    }
                }
              }
        }
    }
    
    struct ContactMessageRow: View {
        var contact: Contact
        
        var body: some View {
            HStack {
                AsyncImage(url: URL(string: contact.profileUrl)) { image in
                    image.resizable()
                        .scaledToFit()
                    
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text(contact.name)
                    if let msg = contact.lastMessage {
                        Text(msg)
                            .lineLimit(1)
                    }
                }
                Spacer()
            }
            
        }
    }
    
}
   
#Preview {
        MessageView()
}

