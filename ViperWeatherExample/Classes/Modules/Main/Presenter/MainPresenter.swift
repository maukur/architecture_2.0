//
//  MainPresenter.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class MainPresenter: BasePresenter<MainInteractor, MainRouter>, MainPresenterProtocol {
   
    // MARK: - Weak properties
    weak var view: MainViewStateInputProtocol?
   
}

// MARK: Private
extension MainPresenter {
    
}

// MARK: MainPresenterProtocol
extension MainPresenter  {
    
     func didQueryChanged(query: String) {
         Task {
             do {
                 if query == "" {
                     await view?.set(state: .none)
                     return
                 }
                
                 try await interactor.search(by: query)
                 guard let weather = interactor.weather else {
                     return
                 }
                 await view?.set(state: .show(weater: "\(weather.main.temp)°F"))
             } catch {
                 await view?.set(state: .error(error: error.localizedDescription))
             }
         }
     }
     
     func didTapShowMoreButton() {
         Task {
             guard let weather = interactor.weather else { return  }
             await router.navigateToDetails(weather: weather) { [weak self] in
                 guard let self else { return }
                 Task {
                     await self.view?.reset()
                 }
             }
         }
     }
}
