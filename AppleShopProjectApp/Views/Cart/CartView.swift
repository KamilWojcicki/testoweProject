//
//  CartView.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import SwiftUI
import CoreData

struct CartView: View {
    @ObservedObject var vm: CoreDataViewModel
    //@EnvironmentObject var vm: CoreDataViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(spacing: 20, content: {
                    
                })
                
                ScrollView(.horizontal, showsIndicators: true, content: {
                    HStack(alignment: .top, content: {
                        ForEach(vm.users) { user in
                            itemsInCartView(entity: user)
                        }
                    })
                })
                
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(vm: CoreDataViewModel())
    }
}

struct itemsInCartView: View {
    
    let entity: User
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Username: \(entity.username ?? "")")
                .bold()
            Text("Password: \(entity.password ?? "")")
                .bold()
            
            if let items = entity.item?.allObjects as? [Item] {
                Text("Items: ")
                    .bold()
                ForEach(items) { item in
                    Text(item.model ?? "")
                    Text(item.name ?? "")
                    Text("\(item.price)")
                }
            }
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
