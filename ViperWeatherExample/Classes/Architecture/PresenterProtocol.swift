//
//  PresenterProtocol.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


class BasePresenter<I: InteractorProtocol, R: BaseRouter> {
    let interactor: I
    let router: R
    
    init(interactor: I, router: R) {
        self.interactor = interactor
        self.router = router
    }
}
