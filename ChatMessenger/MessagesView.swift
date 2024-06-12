//
//  MessagesView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 10/06/24.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var viewModel = MessagesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ola Mundo")
            }
            .toolbar{
                ToolbarItem(id: "contacts",
                            placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    NavigationLink("Contatos", destination: Text("Tela de contatos falsa"))
                }
                ToolbarItem(id: "logout",
                            placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    Button("Logout") {
                        viewModel.logout()
                    }
                }
            }
        }
    }
}

#Preview {
    MessagesView()
}
