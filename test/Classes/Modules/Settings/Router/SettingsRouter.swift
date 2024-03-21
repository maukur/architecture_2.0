//
//  SettingsRouter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class SettingsRouter: SettingsRouterProtocol {
    private var navigation: any NavigationServiceType
    
    init(navigation: any NavigationServiceType){
        self.navigation = navigation
    }
       
}
