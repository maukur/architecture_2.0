//
//  RouterProtocol.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


class BaseRouter: RouterProtocol {
  
    private(set) var navigation: any NavigationServiceType
    
    init(navigation: any NavigationServiceType){
        self.navigation = navigation
    }
    
    func dismis() {
        navigation.modalView = nil
    }
    
    func navigateBack() {
        navigation.items.removeLast()
    }
}

protocol RouterProtocol {
    @MainActor func dismis()
    @MainActor func navigateBack()
}
