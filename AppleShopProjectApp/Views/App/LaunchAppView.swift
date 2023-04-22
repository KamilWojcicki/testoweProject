//
//  LaunchAppView.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import SwiftUI

struct LaunchAppView: View {
    @State private var showLogin = true
    @StateObject var vm = CoreDataViewModel()
    //let logoNewColor = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    var body: some View {
        VStack{
            ZStack{
                if showLogin{
                    LoginView(vm: vm)
                        .transition(.push(from: .leading))
                }else{
                    RegisterView(vm: vm)
                        .transition(.push(from: .leading))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            HStack{
                Text(showLogin ? "Don't have an account?" : "Already have an account?")
                
                Button(action: {
                    withAnimation {
                        showLogin.toggle()
                    }
                }, label: {
                    Text(showLogin ? "Register now" : "Log in")
                        .bold()
                        .foregroundColor(Color.blue)
                })
            }
                .padding(.bottom, 20)
            
            ,alignment: .bottom
        )
        .background(
        Image("appleLogo")
            .renderingMode(.template)
            .resizable()
            .frame(width:1000, height: 1000)
            .foregroundColor(Color("logoColor"))
            .opacity(0.6)
            .offset(x: -150, y: -35)
            .shadow(color: Color.black, radius: 10, x: 0.0, y: 12.0)
        )
        .ignoresSafeArea()
    }
}

struct LaunchAppView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAppView()
    }
}

