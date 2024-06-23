//
//  SignUpRepository.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 23/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class SignUpRepository {
    
    func signUp(withEmail email: String, password: String, image: UIImage, name: String,  completion: @escaping(String?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            guard let user = result?.user, err == nil else {
                print(err as Any)
                completion(err!.localizedDescription)
                return
            }
            print("Usuário criado \(user.uid)")
            
            // Chama a função de fazer o upload
            self.uploadPhoto(image: image, name: name) { err in
                if let err = err {
                    completion(err)
                }
            }
        }
    }
    
    //Função para fazer upload da foto de perfil.
    private func uploadPhoto(image: UIImage, name: String, completion: @escaping(String?) -> Void) {
        
        let filename = UUID().uuidString // Nome aleatório para a imagem
        
        guard let data = image.jpegData(compressionQuality: 0.2) else { return } // Guarda os dados e a taxa de compressão da foto.
        
        let newMetadata = StorageMetadata() // Pega os metadados da imagem lá do storage
        newMetadata.contentType = "image/jpeg"
        
        let ref = Storage.storage().reference(withPath: "/images/\(filename).jpg") // Salva a referência do caminho da imagem.
        
        // Envia os dados.
        ref.putData(data, metadata: newMetadata) {metadata, err in
            ref.downloadURL {url, error in
                
                guard let url = url else { return }
                print("Foto criada \(url)")
                
                // chamada da funcção de criar usuário
                self.createUser(photoUrl: url, name: name, completion: completion)
            }
        }
    }
    
    // Função de criar usuário tendo como parametro a url da photo
    private func createUser(photoUrl: URL, name: String, completion: @escaping (String?) -> Void) {
        let id = Auth.auth().currentUser!.uid
        // Cria a coleção no banco chamada Users
        Firestore.firestore().collection("users")
            .document(id) // pega o nome e salva como document
            
        // Set os dados como um dictionary = chave + valor
            .setData([
                "name": name,
                "uuid" : id,
                "profileUrl": photoUrl.absoluteString
            ]) { err in // Se existir um erro, mostra
            
                if err != nil {
                    if let err = err {
                        print(err.localizedDescription)
                        completion(err.localizedDescription)
                       
                        return
                    }
                    
                }
            }
    }
}
