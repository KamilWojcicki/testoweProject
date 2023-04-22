//
//  MainView.swift
//  AppleShopProjectApp
//
//  Created by Kamil Wójcicki on 22/04/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    
    @ObservedObject var vm1: CoreDataViewModel
    @Environment(\.dismiss) private var dismiss
    init(vm1: CoreDataViewModel) {
        self.vm1 = vm1
        _ = Dependencies() }
    
    
    
    
    var body: some View {
        List {
            
            if vm.searchResult.contains(where: { $0.type == .iphone}) {
                iPhoneSection
            }
            
            if vm.searchResult.contains(where: { $0.type == .ipad}) {
                iPadSection
            }
            
            if vm.searchResult.contains(where: { $0.type == .macbook}) {
                macBookSection
            }
            if vm.searchResult.contains(where: { $0.type == .mac}) {
                macSection
            }
            
        }
        .navigationTitle("APPLE SHOP")
        
        .animation(.default, value: vm.searchTerm)
        .searchable(text: $vm.searchTerm, prompt: "Find a device")
        .textInputAutocapitalization(.never)
        .onChange(of: vm.searchTerm) { newValue in
            vm.search(newValue)
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign Out") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    NavigationLink(destination: KemInfoView()){
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                    }
                    NavigationLink(destination: CartView(vm: vm1)){
                        Image(systemName: "cart")
                            .foregroundColor(.blue)
                        
                        }
                    }
                }
            }
            .animation(.default, value: vm.searchTerm)
            .searchable(text: $vm.searchTerm, prompt: "Find a device")
            .onChange(of: vm.searchTerm) { newValue in
                vm.search(newValue)
                
                
                
            }
            
        }
        
    
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView(vm1: CoreDataViewModel())
    }
}
        
  
extension MainView {
    
    private func header(title: DeviceType) -> some View {
        Text(title.rawValue)
            .font(.largeTitle)
            .textCase(.none)
            .frame(maxWidth: .infinity)
            .padding()
    }
    
    private var iPhoneSection: some View {
        Section(header: header(title: .iphone)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .iphone {
                    NavigationLink( destination:
                                        DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var iPadSection: some View {
        Section(header: header(title: .ipad)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .ipad {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var macBookSection: some View{
        Section(header: header(title: .macbook)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .macbook {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var macSection: some View{
        Section(header: header(title: .mac)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .mac {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
}
   
