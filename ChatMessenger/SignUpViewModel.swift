//
//  SignUpViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

class SignUpViewModel : ObservableObject {
    var name = ""
    var email = ""
    var password = ""
    
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp() {

        print("nome: \(name)", "email: \(email)", "senha: \(password)")
        
        //Verifica se o tamanho da imagem é menor que zero, se for pede para selecionar uma foto.
        if (image.size.width <= 0 ) {
            formInvalid = true
            alertText = "Selecione uma foto."
            return
        }
        
        isLoading = true
        
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
            
            // Chama a função de fazer o upload
            self.uploadPhoto()
        }
    }
    
    //Função para fazer upload da foto de perfil.
    private func uploadPhoto() {
        
        let filename = UUID().uuidString // Nome aleatório para a imagem
        guard let data = image.jpegData(compressionQuality: 0.2) else { return } // Guarda os dados e a taxa de compressão da foto.
        
        let newMetadata = StorageMetadata() // Pega os metadados da imagem lá do storage
        newMetadata.contentType = "image/jpeg"
        
        let ref = Storage.storage().reference(withPath: "/images/\(filename).jpg") // Salva a referência do caminho da imagem.
        
        // Envia os dados.
        ref.putData(data, metadata: newMetadata) {metadata, err in
            ref.downloadURL {url, error in
                self.isLoading = false
                print("Foto criada \(url)")
            }
        }
    }
}

//teste
