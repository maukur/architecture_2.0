//
//  MainAssembly.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


import SwiftUI

final class MainAssembly: Assembly {
    
    @MainActor 
    func build() -> some View {
        
        let navigation = container.resolve(NavigationAssembly.self).build()
        let weatherService = container.resolve(OpenWeathetServiceAssembly.self).build()

        // Router
        let router = MainRouter(navigation: navigation)

        // Interactor
        let interactor = MainInteractor(weatherService: weatherService)

        //ViewState
        let viewState =  MainViewState()

        // Presenter
        let presenter = MainPresenter(interactor: interactor, router: router)
        
        viewState.prepare(with: presenter)
        presenter.view = viewState
        
        // View
        let view = MainView(viewState: viewState)
        return view
    }
}
