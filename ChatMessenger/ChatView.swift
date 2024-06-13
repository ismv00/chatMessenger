//
//  ChatView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 12/06/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.messages, id: \.self) { message in
                     MessageRow(message: message)
                }
            }
        }
    }
}

struct MessageRow : View {
    
    let message : Message
    var body: some View {
        Text(message.text)
            .background(Color(white: 0.95))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: message.isMe ? .leading : .trailing)
        
        
    }
}

#Preview {
    ChatView()
}
