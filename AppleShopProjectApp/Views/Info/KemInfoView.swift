//
//  KemInfoView.swift
//  AppleShopApp
//
//  Created by Kamil Wójcicki on 16/04/2023.
//

import SwiftUI

struct KemInfoView: View {
    var body: some View {
        ScrollView {
            VStack{
                VStack{
                    Image("logoKEM")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .top)
                        
                        
                }
                
                VStack{
                    
                    Text("KEM CONCERN is a company dedicated to developing iOS software in Swift and also with Swift UI.")
                        .customTextModifier()

                    Text("A team of experienced programmers offers comprehensive services, including consultations, design, implementation and technical support.")
                        .customTextModifier()
                        
                    Text("The company focuses on innovation, quality and customer satisfaction.")
                        .customTextModifier()
                    Text("Its software is the perfect solution for anyone looking for the best and latest solutions in the industry.")
                        .customTextModifier()
                    Spacer()
                }
                .padding()
                .offset(y: -30)
                
            }
        }
        
        
    }
}

struct KemInfoView_Previews: PreviewProvider {
    static var previews: some View {
        KemInfoView()
    }
}

struct CustomTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .background(Color("backgroundColor"))
            .cornerRadius(10)
            .shadow(radius: 10, x: 10, y: 10)
            .padding(.bottom, 20)
    }
}
extension View {
    func customTextModifier() -> some View {
        modifier(CustomTextModifier())
    }
}
