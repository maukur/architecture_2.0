//
//  MainRouter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class MainRouter: MainRouterProtocol {
    var navigation: any NavigationServiceType
    
    init(navigation: any NavigationServiceType){
        self.navigation = navigation
    }
       
    func navigateToSettings(didClosed: (()->Void)?) {
        navigation.items.append(.settings(didClosed: didClosed))
    }
}
