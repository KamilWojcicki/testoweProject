//
//  CoreDataViewModel.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import Foundation
import CoreData

struct PersonModel : Identifiable {
    let id = UUID().uuidString
    let username: String
    let password: String
    let confirmPassword: String
}

final class CoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var users: [User] = []
    @Published var items: [Item] = []
    init() {
        //
        getUsers()
    }
    func getUsers() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
           users = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
        
    }
    
    func addUser(username: String, password: String) {
        let newUser = User(context: manager.context)
        newUser.username = username
        newUser.password = password
        save()
    }
    
    func addItemToChart(name: String, price: Double) {
        let newItem = Item(context: manager.context)
        
        newItem.name = name
        newItem.price = price
    }
    
    func save() {
        manager.save()
    }
}
