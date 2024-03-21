//
//  OpenWeathetServiceType.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//	
//

import Foundation

protocol OpenWeathetServiceType {
    func fetchWeather(for city: String) async throws -> WeatherData 
}
