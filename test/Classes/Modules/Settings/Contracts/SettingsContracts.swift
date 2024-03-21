//
//  SettingsContracts.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI


// Router
protocol SettingsRouterProtocol: RouterProtocol {

}

// Presenter
protocol SettingsPresenterProtocol: PresenterProtocol {
    func execute()
}

// Interactor
protocol SettingsInteractorProtocol: InteractorProtocol {

}

// ViewState
protocol SettingsViewStateProtocol: ObservableObject {
    func set(with presenter: SettingsPresenterProtocol)
    func execute()
}
