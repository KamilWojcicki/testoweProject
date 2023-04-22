//
//  RegisterView.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import SwiftUI

struct RegisterView: View {
    //@EnvironmentObject var vm: CoreDataViewModel
    @ObservedObject var vm: CoreDataViewModel
    //@StateObject var vm = CoreDataViewModel()
    @StateObject var vm1 = AuthorizationViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    
    let buttonBackground = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.884618108))
    let logoNewColor = Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5601987349))
    var body: some View {
        NavigationStack {
            VStack{
                Text("Register now")
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
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Confirm Password")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    
                    SecureField("enter your password again", text: $confirmPassword)
                        .font(.system(size: 20))
                        .padding(.top, 5)
                        .textInputAutocapitalization(.never)
                    Divider()
                        .frame(width: 220)
                })
                .padding(.top, 20)
                
                
                
                Button(action: {
                    if !username.isEmpty && !password.isEmpty && !confirmPassword.isEmpty{
                        if !vm.users.contains(where: {$0.username == username}){
                            if passwordIsAppropriate() {
                                if password == confirmPassword {
                                    vm.addUser(username: username, password: password)
                                    vm1.alertType = .successAdded
                                    
                                    username = ""
                                    password = ""
                                    confirmPassword = ""
                                }else {
                                    vm1.alertType = .errorWithPassword
                                }
                            }
                        }
                        else{
                            vm1.alertType = .errorWithUsername
                        }
                    }else {
                        vm1.alertType = .emptyFields
                    }
                    
                    vm1.showAlert.toggle()
                    
                    
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
                .disabled(!passwordIsAppropriate())
                
            }
            .padding()
            .padding(.top, 100)
            .alert(isPresented: $vm1.showAlert, content: {
                vm1.getAlert()
            })
        }
    }
    func passwordIsAppropriate() -> Bool {
        if password.count >= 3 {
            return true
        }
        return false
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(vm: CoreDataViewModel())
    }
}
