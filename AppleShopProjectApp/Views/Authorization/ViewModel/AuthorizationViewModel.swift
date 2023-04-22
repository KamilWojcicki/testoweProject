//
//  AuthorizationViewModel.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import Foundation
import SwiftUI

enum MyAlerts {
    case successAdded
    case errorWithPassword
    case errorWithUsername
    case successLogin
    case emptyFields
}

final class AuthorizationViewModel: ObservableObject {
    @Published var alertType: MyAlerts? = nil
    @Published var showAlert: Bool = false
    @Published var usernameArray = []

    func getAlert() -> Alert {
        switch alertType {
        case .errorWithPassword:
            return Alert(
                title: Text("Password Error"),
                message: Text("Passwords are different"),
                dismissButton: .cancel(Text("Try again")))
        case .successAdded:
            return Alert(
                title: Text("Success!"),
                message: Text("User added successfully"),
                dismissButton: .default(Text("OK"), action: {
                    
            }))
        case .errorWithUsername:
            return Alert(
                title: Text("Username Error"),
                message: Text("Username already exist"),
                dismissButton: .cancel(Text("Try different username")))
        case .successLogin:
            return Alert(
                title: Text("Successfull LOG IN"),
                message: nil,
                dismissButton: .cancel(Text("OK")))
        case .emptyFields:
            return Alert(
                title: Text("Fields empty!"),
                message: Text("One or more fields are empty"),
                dismissButton: .cancel(Text("Try again")))
        default:
            return Alert(title: Text("ERROR"))
        }
    }
}

