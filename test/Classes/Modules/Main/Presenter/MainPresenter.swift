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
    
    func didTapNextButton() {
        router.navigateToSettings { [weak self] in
            guard let self else { return }
            Task {
                await self.test()
            }
        }
       
    }
    
 
    func test() async  {
        for _ in 0...50 {
            try? await Task.sleep(for: .seconds(1))
            await viewState.increase()
        }
    }
}
