//
//  SettingsPresenter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class SettingsPresenter: SettingsPresenterProtocol {
    
    private let router: SettingsRouterProtocol
    private let viewState: any SettingsViewStateProtocol
    private let interactor: SettingsInteractorProtocol
    private let didClosed: (()->Void)?
    
    init(router: SettingsRouterProtocol,
         interactor: SettingsInteractorProtocol,
         viewState: any SettingsViewStateProtocol,
         didClosed: (()->Void)?) {
        self.router = router
        self.interactor = interactor
        self.viewState = viewState
        self.didClosed = didClosed
    }
    
    
    func execute() {
        didClosed?()
    }
    
}
