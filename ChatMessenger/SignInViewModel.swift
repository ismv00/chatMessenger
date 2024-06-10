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
    
    
    func signIn() {
        print("email: \(email)", "senha: \(password)")
        self.isLoading = true // altera a variavel para true para ser apresentada em tela
        
        // Chama o metodo de autenticação por e-mail e senha do Firebase, pegando o e-mail e senha enviados.
        // Se existir um usuário e senha corretos, a variavel isLoading vira false e o uid do usuário é apresentado
        // Se não existir um usuário, o formuário de erro é mostrado (formInvalid) e salvamos a descriçào do erro na variável alertText
        // o isLoading vira false e eu retorno esse erro para ser mostrado em tela.
        Auth.auth().signIn(withEmail: email, password: password) {
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuário logado \(user.uid)")
        }
    }
}
