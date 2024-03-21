//
//  WeatherDetailsRouter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class WeatherDetailsRouter: WeatherDetailsRouterProtocol {
    private var navigation: any NavigationServiceType
    
    init(navigation: any NavigationServiceType){
        self.navigation = navigation
    }
    
    @MainActor
    func navigateBack() {
        navigation.items.removeLast()
    }
       
}
