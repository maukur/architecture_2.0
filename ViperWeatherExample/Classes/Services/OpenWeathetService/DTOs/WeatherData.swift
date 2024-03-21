//
//  WeatherData.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24.
//

import Foundation
struct WeatherData: Codable {
    let coord: Coordinate
    let weather: [WeatherDescription]
    let base: String
    var main: MainWeatherData
    let visibility: Int
    let wind: WindData
    let clouds: CloudData
    let dt: Int
    let sys: SysData
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct MainWeatherData: Codable {
    var temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
}

struct WindData: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct CloudData: Codable {
    let all: Int
}

struct SysData: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct Coordinate : Codable {
    let lat: Double
    let lon: Double
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


