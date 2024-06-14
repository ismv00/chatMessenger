//
//  ChatView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 12/06/24.
//

import SwiftUI

struct ChatView: View {
    let toId: String
    let username: String
    
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.messages, id: \.self) { message in
                     MessageRow(message: message)
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Digite a mensagem", text: $viewModel.text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0))
                    )
                
                Button{
                    viewModel.sendMessage(toId: toId)
                } label: {
                    Text("Enviar")
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                .disabled(viewModel.text.isEmpty)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
        }
        .navigationTitle(username)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.onAppear(toId: toId)
        }
    }
}

struct MessageRow : View {
    
    let message : Message
    var body: some View {
        VStack(alignment: .leading) {
            Text(message.text)
                
                .padding(.vertical, 5)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 10)
                .background(Color(white: 0.95))
                .frame(maxWidth: 260, alignment: message.isMe ? .leading : .trailing)
                //.padding(.leading, message.isMe ? 0 : 50)
                //.padding(.trailing, message.isMe ? 50 : 0)
                
        }
        .frame(maxWidth: .infinity, alignment: message.isMe ? .leading : .trailing)
    }
}

#Preview {
    ChatView(toId: UUID().uuidString,username: "Ola Mundo")
}
