//
//  ContentView.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel() // Instanciando a ViewModel que contem o modelo de dados e salvando na variável viewmodel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("chat_logo") // Redimensionar a imagem
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                TextField("Entre com seu e-mail", text: $viewModel.email)
                    .autocapitalization(.none) // Sem letra maiuscula no começo
                    .disableAutocorrection(false) // Desabilita o corretor
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0) // bordas arredondadas
                    .overlay(RoundedRectangle(cornerRadius: 24.0) // Sombra ao redor do texfiel
                        .stroke(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.bottom, 20) // Padding só na parte de baixo para o próximo elemento
                
                SecureField("Entre com sua senha", text: $viewModel.password) // campo de senha
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .stroke(Color(uiColor: .separator), style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.bottom, 30)
                
                if viewModel.isLoading { // Se a var isLoading for true, carrega a progress view
                    ProgressView()
                        .padding()
                }
                
                Button {
                    viewModel.signIn() // Chama a função de login da viewmodel
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity) // estica o elemento para pegar a pagina toda. Apenas na margin
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                .alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alertText))
                
                }
                
                Divider() // Linha que divide os elementos
                    .padding()
                
                NavigationLink(destination: SignUpView()) { // Navegação para a próxima página
                    Text("Não tem uma conta? Clique aqui.")
                        .foregroundColor(.black)
                }
                
            }
            .frame(maxWidth: .infinity ,maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240/255, green: 231/255, blue: 210 / 255))
            .navigationTitle("Login")
            .navigationBarHidden(true) // Não é mais necessário
            
        }
    }
}

#Preview {
    SignInView()
}
