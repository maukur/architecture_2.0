//
//  OpenWeathetService.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//
//

import Foundation

public final class OpenWeathetService: OpenWeathetServiceType {

    private let apiKey: String = "2e806c6aeb44e18ccaef341a22c7474c"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String) async throws -> WeatherData {
        let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        do {
            let data = try await fetchData(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            return weatherData
        } catch {
            throw error
        }
    }
    
    private func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
