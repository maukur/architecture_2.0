//
//  MainInteractor.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

final class MainInteractor: MainInteractorProtocol {

    private let weatherService: OpenWeathetServiceType
    
    var weather: WeatherData?

    init(weatherService: any OpenWeathetServiceType) {
        self.weatherService = weatherService
    }
    
    func search(by query: String) async throws {
        weather = try await weatherService.fetchWeather(for: query)
    }
}

// MARK: Private
extension MainInteractor {
    
}
