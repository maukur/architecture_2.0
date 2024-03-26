//
//  MainContracts.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI


// Router
protocol MainRouterProtocol {
    @MainActor func navigateToDetails(weather: WeatherData,didReset: (()->Void)?)
}

// Presenter
protocol MainPresenterProtocol: AnyObject {
    func didTapShowMoreButton()
    func didQueryChanged(query: String)
}

// Interactor
protocol MainInteractorProtocol: InteractorProtocol {
    func search(by query: String) async throws 
    var weather: WeatherData? { get }
}

// ViewState
protocol MainViewStateOutputProtocol: ObservableObject {
    func prepare(with presenter: MainPresenterProtocol)
    func didTapShowMoreButton()
    var query: String { get set }
    var state: MainViewViewState { get }
}

protocol MainViewStateInputProtocol: AnyObject {
    @MainActor func set(state: MainViewViewState)
    @MainActor func reset()
}

enum MainViewViewState {
    case none
    case error(error: String)
    case show(weater: String)
}
