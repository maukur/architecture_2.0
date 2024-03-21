//
//  WeatherDetailsContracts.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI


// Router
protocol WeatherDetailsRouterProtocol: RouterProtocol {
    @MainActor func navigateBack()
}

// Presenter
protocol WeatherDetailsPresenterProtocol: PresenterProtocol {
    func didTapResetButton()
    func onAppear()
}

// Interactor
protocol WeatherDetailsInteractorProtocol: InteractorProtocol {
    var weather: WeatherData { get } 
}


// ViewState
protocol WeatherDetailsViewStateOutputProtocol: ObservableObject {
    func set(with presenter: WeatherDetailsPresenterProtocol)
    func didTapResetButton()
    var weather: WeatherData? { get }
    var closeTime: Int? { get }
    func onAppear()
}

protocol WeatherDetailsViewStateInputProtocol {
    @MainActor func set(weather: WeatherData)
    @MainActor func set(closeTime: Int)
}
