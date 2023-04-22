//
//  DeviceInfo.swift
//  AppleShopApp
//
//  Created by Kamil Wójcicki on 13/04/2023.
//

import SwiftUI

struct DeviceInfo: View {
    let dev: DeviceModel
    var body: some View {
        HStack{
            Image(dev.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 110, alignment: .center)
            VStack{
                Text(dev.name)
                //Text(device.model)
                Text("\(dev.price, specifier: "%.2f") zł")
            }
        }
        .padding()
    }
}

struct DeviceInfo_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfo(dev: DeviceModel(name: "", type: .iphone, price: 0.0, image: ""))
    }
}
