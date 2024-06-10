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
        if viewModel.isLogged {
            Text("Ola Mundo")
        } else {
            SignInView()
        }
    }
}

#Preview {
    ContentView()
}
