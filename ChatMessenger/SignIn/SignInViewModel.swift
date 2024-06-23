//
//  SignInViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import Foundation
import FirebaseAuth


class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    private let repo: SignInRepository
    
    init(repo: SignInRepository) {
        self.repo = repo
    }
    
    
    func signIn() {
        print("email: \(email)", "senha: \(password)")
        isLoading = true // altera a variavel para true para ser apresentada em tela
        
        repo.signIn(withEmail: email, password: password) { err in
            if let err = err {
                self.formInvalid = true
                self.alertText = err
            }
            self.isLoading = false
        }
    }
}
