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
    @MainActor static let navigation = NavigationService()
    
    @MainActor func build() -> NavigationService {
        return NavigationAssembly.navigation
    }
}
