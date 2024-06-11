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
        Button {
            viewModel.logout()
        } label: {
            Text("Logout")
        }
    }
}

#Preview {
    MessagesView()
}
