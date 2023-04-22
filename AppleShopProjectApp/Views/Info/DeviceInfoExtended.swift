//
//  DeviceInfoExtended.swift
//  AppleShopApp
//
//  Created by Kamil Wójcicki on 13/04/2023.
//

import SwiftUI

struct DeviceInfoExtended: View {
    //@StateObject var vm = CoreDataViewModel()
    @ObservedObject var vm: CoreDataViewModel
    let dev: DeviceModel
    
    var body: some View {
        
            VStack{
               // let colorBackground = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.5))
                let buttonBackground = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.5354984894))
                Spacer()
                HStack{
                    Image(dev.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150, maxHeight: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(width: 310, height: 300)
                .background(Color("backgroundColor"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.bottom, 10)
                HStack{
                    HStack{
                        
                        Text("Model:\n\(dev.name)")
                            .padding()
                    }
                    .frame(width: 150, height: 100, alignment: .leading)
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    HStack{
                        Text("Price: \n\(dev.price, specifier: "%.2f") zł")
                            .padding()
                    }
                    .frame(width: 150, height: 100, alignment: .leading)
                    .background(Color("backgroundColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Button(action: {
                    //vm.addItemToChart(name: dev.name, price: dev.price)
                }, label: {
                    Text("Add to CART")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(buttonBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 10)
                        .padding(.top, 30)
                })
                
                Spacer()
                Text("Designed by KEM")
                Text("Kamil-Eryk-Mateusz")
                    .font(.caption2)
                VStack{
                    
                }
            }
    }
}

struct DeviceInfoExtended_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfoExtended(vm: CoreDataViewModel(), dev: DeviceModel(name: "", type: .iphone, price: 0.0, image: ""))
    }
}
