//
//  DeviceService.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import Foundation

/// DeviceServiceProtocol pozwala ci na wybranie danych, które chcesz "wstrzyknąć do aplikacji"

/// Gdy wybiersz MockDeviceService zostanie wstrzyknięta 'dummy data'
/// Gdy wybierzesz Device Service zostanie wstrzyknięte 'CoreData'



protocol DeviceServiceProtocol {
    func fetchDevice() -> [DeviceModel]
}


class DeviceService: DeviceServiceProtocol {
    
    /// FetchDevice musi zwrócić [DeviceModel]
    /// Przenieś sobie tutaj cała logikę odnośnie CoreData i zwróc w funkcji poniżej tablice z DeviceModel ( [DeviceModel] )
    func fetchDevice() -> [DeviceModel] {
        
        /// Tutaj zostały utworzona przykładowa stała
        // TODO: Usunać przykład!
        // TODO: Dodać CoreData
        // TODO: Zwrócić [DeviceModel]
        
        let device = DeviceModel(name: "sample", type: .ipad, price: 99.99, image: "sampleImage")
        return [device]
    }
    
}


class MockDeviceService: DeviceServiceProtocol {
    
    func fetchDevice() -> [DeviceModel] {
        let devices = [
            /// IPHONE
            DeviceModel(name: "iPhone 14", type: .iphone, price: 4999.0, image: "ip14"),
            DeviceModel(name: "iPhone 14 Pro Max", type: .iphone, price: 7999.0, image: "ip14proMax"),
            DeviceModel(name: "iPhone 13 Mini", type: .iphone, price: 3999.0, image: "ip13mini"),
            DeviceModel(name: "iPhone 12", type: .iphone, price: 3499.0, image: "ip12"),
            DeviceModel(name: "iPhone SE 2020", type: .iphone, price: 3299.0, image: "ipSE"),
            
            /// IPAD
            DeviceModel(name: "iPad", type: .ipad, price: 2999.0, image: "ipad"),
            DeviceModel(name: "iPad Air", type: .ipad, price: 2599.0, image: "ipadAir"),
            DeviceModel(name: "iPad Mini", type: .ipad, price: 2299.0, image: "ipadMini"),
            DeviceModel(name: "iPad Pro", type: .ipad, price: 6299.0, image: "ipadPro"),
            
            
            /// MACBOOK
            DeviceModel(name: "MacBook Air", type: .macbook, price: 6499.0, image: "macbookAir"),
            DeviceModel(name: "MacBook Pro", type: .macbook, price: 8499.0, image: "macbookPro"),
            
            /// MAC
            DeviceModel(name: "Mac Mini", type: .mac, price: 3499.0, image: "macmini"),
            DeviceModel(name: "Mac Studio", type: .mac, price: 5499.0, image: "macStudio"),
            DeviceModel(name: "Mac Pro", type: .mac, price: 8499.0, image: "macPro")
        ]
        
        return devices
    }
    
}
