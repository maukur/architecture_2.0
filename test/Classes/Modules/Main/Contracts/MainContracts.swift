//
//  MainContracts.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI


// Router
protocol MainRouterProtocol: RouterProtocol {
    func navigateToSettings(didClosed: (()->Void)?)
}

// Presenter
protocol MainPresenterProtocol: PresenterProtocol {
    func didTapNextButton()
}

// Interactor
protocol MainInteractorProtocol: InteractorProtocol {

}

// ViewState
protocol MainViewStateOutputProtocol: ObservableObject {
    func set(with presenter: MainPresenterProtocol)
    var count: Int { get }
    func didTapNextButton()
}

protocol MainViewStateInputProtocol {
    @MainActor func increase()
    @MainActor func decrease()
}


