//
//  WeatherDetailsPresenter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class WeatherDetailsPresenter: BasePresenter<WeatherDetailsInteractor, WeatherDetailsRouter>, WeatherDetailsPresenterProtocol {

    // MARK: - Weak properties
    weak var view: WeatherDetailsViewStateInputProtocol? = nil
    private var didReset: (()->Void)? = nil
    
    init(interactor: WeatherDetailsInteractor, router: WeatherDetailsRouter, didReset: (() -> Void)? = nil) {
        super.init(interactor: interactor, router: router)
        self.didReset = didReset
    }
    
    
    func onAppear() {
        Task {
            await view?.set(weather: interactor.weather)
        }
    }
    
    func didTapResetButton() {
        didReset?()
        Task {
            let timerSeconds = 3
            for sec in 0...timerSeconds {
                try? await Task.sleep(for: .seconds(1))
                await view?.set(closeTime: timerSeconds-sec)
            }
            await router.navigateBack()
        }
    }
    
}
