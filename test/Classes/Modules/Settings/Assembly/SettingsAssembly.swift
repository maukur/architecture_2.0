//
//  SettingsAssembly.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


import SwiftUI

final class SettingsAssembly: Assembly {
    
    func build(didClosed: (()->Void)?) -> some View {
        
        let navigation = container.resolve(NavigationAssembly.self).build()

        // Router
        let router = SettingsRouter(navigation: navigation)

        // Interactor
        let interactor = SettingsInteractor()

        //ViewState
        let viewState =  SettingsViewState()

        // Presenter
        let presenter = SettingsPresenter(router: router, interactor: interactor, viewState: viewState, didClosed: didClosed)
        
        
        viewState.set(with: presenter)
        
        // View
        let view = SettingsView(viewState: viewState)
        return view
    }
}
