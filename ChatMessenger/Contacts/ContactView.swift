//
//  ContactsView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 11/06/24.
//

import SwiftUI

struct ContactView: View {
    @StateObject var viewModel = ContactViewModel(repo: ContactRepository())
    
    var body: some View {
        
        
        VStack {
            
            if viewModel.isLoading {
                ProgressView()
            }
            List(viewModel.contacts, id: \.self) { contact in
                NavigationLink{
                    ChatView(contact: contact)
                } label: {
                    ContactRow(contact: contact)
                }
                
            }
        }.onAppear {
            viewModel.getContacts()
        }
        .navigationTitle("Contatos")
        
    }
   
}


struct ContactRow: View {
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
            
            Text(contact.name)
        }
        
    }
}

#Preview {
    ContactView()
}
