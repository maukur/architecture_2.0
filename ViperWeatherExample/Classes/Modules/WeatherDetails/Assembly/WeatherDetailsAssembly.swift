//
//  WeatherDetailsAssembly.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


import SwiftUI

final class WeatherDetailsAssembly: Assembly {
    
    @MainActor 
    func build(weather: WeatherData, didReset: (()->Void)?) -> some View {
        
        let navigation = container.resolve(NavigationAssembly.self).build()

        // Router
        let router = WeatherDetailsRouter(navigation: navigation)

        // Interactor
        let interactor = WeatherDetailsInteractor(weather: weather)

        //ViewState
        let viewState =  WeatherDetailsViewState()

        // Presenter
        let presenter = WeatherDetailsPresenter(interactor: interactor, router: router, didReset: didReset)
        
        viewState.set(with: presenter)
        presenter.view = viewState
        
        // View
        let view = WeatherDetailsView(viewState: viewState)
        return view
    }
}
