//
//  ContentView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        VStack {
            // Criar o botão para fazer upload da foto de perfil
            Button {
                // Altera a variavel para true para mostrar a folha em branco onde vai contar as imagens
            isShowPhotoLibrary = true
            } label: {
                // Verifica se existe uma imagem, senão mostra apenas o texto.
                if viewModel.image.size.width > 0 {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("GreenColor"), lineWidth: 4))
                        .shadow(radius: 7)
                } else {
                    Text("Foto")
                        .frame(width: 130, height: 130)
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(100.0)
                }
            }
            .padding(.bottom, 32)
            // Se existir a variavel for true, pega a imagem selecionada
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(selectedImage: $viewModel.image)
            }
            
            TextField("Entre com seu nome", text: $viewModel.name)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(RoundedRectangle(cornerRadius: 24.0)
                    .stroke(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0)))
                .padding(.bottom, 20)
            
            TextField("Entre com seu e-mail", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(RoundedRectangle(cornerRadius: 24.0)
                    .stroke(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0)))
                .padding(.bottom, 20)
            
            SecureField("Entre com sua senha", text: $viewModel.password)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(RoundedRectangle(cornerRadius: 24.0)
                    .stroke(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0)))
                .padding(.bottom, 30)
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            
            Button {
                viewModel.signUp()
            } label: {
                Text("Entrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("GreenColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(24.0)
            }
            .alert(isPresented: $viewModel.formInvalid) {
                Alert(title: Text(viewModel.alertText))
            }
            
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(Color.init(red: 240/255, green: 231/255, blue: 210 / 255))
        .navigationBarTitleDisplayMode(.inline) // Não é mais necessário
        
    }
}

#Preview {
    SignUpView()
}
