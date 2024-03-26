//
//  MainRouter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class MainRouter: BaseRouter, MainRouterProtocol {
   
    @MainActor
    func navigateToDetails(weather: WeatherData,didReset: (()->Void)?) {
        navigation.items.append(.weatherDetails(weather: weather, didReset: didReset))
    }
}
