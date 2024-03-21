//
//  WeatherDetailsViewState.swift
//  ViperWeatherExample
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class WeatherDetailsViewState: WeatherDetailsViewStateOutputProtocol {
    
    
    private let id = UUID()
    private var presenter: WeatherDetailsPresenterProtocol?
    
    @Published var weather: WeatherData?
    @Published var closeTime: Int?

    func set(with presener: WeatherDetailsPresenterProtocol) {
        self.presenter = presener
    }
    
    func onAppear() {
        presenter?.onAppear()
    }
    
    func didTapResetButton() {
        presenter?.didTapResetButton()
    }
    
}

extension WeatherDetailsViewState: WeatherDetailsViewStateInputProtocol{
    @MainActor
    func set(weather: WeatherData) {
        withAnimation {
            self.weather = weather
        }
    }
    
    @MainActor
    func set(closeTime: Int) {
        withAnimation {
            self.closeTime = closeTime
        }
    }
    
}
