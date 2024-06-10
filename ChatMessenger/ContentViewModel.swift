//
//  ContentViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 09/06/24.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var isLogged = Auth.auth().currentUser != nil 
}
