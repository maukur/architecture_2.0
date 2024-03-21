//
//  WeatherDetailsPresenter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class WeatherDetailsPresenter: WeatherDetailsPresenterProtocol {
    
    private let router: WeatherDetailsRouterProtocol
    private let viewState: WeatherDetailsViewStateInputProtocol
    private let interactor: WeatherDetailsInteractorProtocol
    private let didReset: (()->Void)?
    
    init(router: any WeatherDetailsRouterProtocol, viewState: WeatherDetailsViewStateInputProtocol, interactor: any WeatherDetailsInteractorProtocol, didReset: (() -> Void)? = nil) {
        self.router = router
        self.viewState = viewState
        self.interactor = interactor
        self.didReset = didReset
    }
    
    func onAppear() {
        Task {
            await viewState.set(weather: interactor.weather)
        }
    }
    
    func didTapResetButton() {
        didReset?()
        Task {
            let timerSeconds = 3
            for sec in 0...timerSeconds {
                try? await Task.sleep(for: .seconds(1))
                await viewState.set(closeTime: timerSeconds-sec)
            }
            await router.navigateBack()
        }
    }
    
}
