//
//  NavigationAssembly.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class NavigationAssembly: Assembly {
    
    //Only one navigation should use in app
    static let navigation: any NavigationServiceType = NavigationService()
    
    func build() -> any NavigationServiceType {
        return NavigationAssembly.navigation
    }
}
