//
//  MainPresenter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class MainPresenter: MainPresenterProtocol {
   
    private let router: MainRouterProtocol
    private let viewState: any MainViewStateInputProtocol
    private let interactor: MainInteractorProtocol
    
    init(router: MainRouterProtocol,
         interactor: MainInteractorProtocol,
         viewState: any MainViewStateInputProtocol) {
        self.router = router
        self.interactor = interactor
        self.viewState = viewState
    }
    
    func didQueryChanged(query: String) {
        Task {
            do {
                if query == "" {
                    await viewState.set(state: .none)
                    return
                }
               
                try await interactor.search(by: query)
                guard let weather = interactor.weather else {
                    return
                }
                await viewState.set(state: .show(weater: "\(weather.main.temp)°F"))
            } catch {
                await viewState.set(state: .error(error: error.localizedDescription))
            }
        }
    }
    
    func didTapShowMoreButton() {
        Task {
            guard let weather = interactor.weather else { return  }
            await router.navigateToDetails(weather: weather) { [weak self] in
                guard let self else { return }
                Task {
                    await self.viewState.reset()
                }
            }
        }
    }
}
