//
//  ContentView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 09/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLogged {
                MessageView()
            } else {
                SignInView()
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    ContentView()
}
