//
//  LoginView.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm: CoreDataViewModel
    @StateObject var vm1 = AuthorizationViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var path = NavigationPath()
    
    let buttonBackground = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.884618108))
    var body: some View {
        NavigationStack (path: $path){
            VStack{
                Text("Sign in")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .kerning(1.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Username")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    
                    TextField("enter your username", text: $username)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    
                        
                    Divider()
                        .frame(width: 220)
                })
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Password")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    
                    SecureField("enter your password", text: $password)
                        .font(.system(size: 20))
                        .padding(.top, 5)
                        .textInputAutocapitalization(.never)
                    Divider()
                        .frame(width: 220)
                })
                .padding(.top, 20)
                
                
                
                Button(action: {
                    if vm.users.contains(where: { User in
                        User.username == username && User.password == password
                    }){
                        vm1.alertType = .successLogin
                        path.append("MainView")
                    }else {
                        vm1.alertType = .errorWithUsername
                    }
                    vm1.showAlert.toggle()
                    
                    if vm.users.contains(where: { $0.username == username && $0.password == password
                        
                    }){
                        
                    }
                }, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(buttonBackground)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.6), radius: 5, x: 0, y: 0)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
            }
            .navigationDestination(for: String.self) { view in
                if view == "MainView" {
                    MainView(vm1: vm)
                            //.environmentObject(vm)
                }
            }
        }
        //.environmentObject(vm)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(vm: CoreDataViewModel())
    }
}
