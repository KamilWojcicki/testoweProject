//
//  MainViewModel.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import Foundation

enum DeviceType: String  {
    case iphone = "iPhone"
    case ipad = "iPad"
    case macbook = "MacBook"
    case mac = "Mac"
}

struct DeviceModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let type: DeviceType
    let price: Double
    let image: String
    
}

final class MainViewModel: ObservableObject {
    @Inject var devices: DeviceServiceProtocol
    private(set) var data: [DeviceModel] = []
    
    @Published var searchResult: [DeviceModel] = []
    @Published var searchTerm: String = ""
    
    init() {
        self.data = devices.fetchDevice()
        search()
    }
    
    func search(_ value: String = "") {
        let fileteredData = data.filter {
            $0.name.lowercased().contains(value.lowercased())
        }
        
        self.searchResult = searchTerm.isEmpty ? data : fileteredData
    }
    
}

