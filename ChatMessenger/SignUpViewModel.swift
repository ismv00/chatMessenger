//
//  SignUpViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import Foundation
import FirebaseAuth

class SignUpViewModel : ObservableObject {
    var name = ""
    var email = ""
    var password = ""
    
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp() {
        isLoading = true
        print("nome: \(name)", "email: \(email)", "senha: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) {
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuário criado \(user.uid)")
        }
    }
}

//teste
