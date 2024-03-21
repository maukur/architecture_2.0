//
//  MainViewState.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//
import SwiftUI
import Combine

final class MainViewState: MainViewStateOutputProtocol {
   
    private var presenter: MainPresenterProtocol?
    private var subscription: Set<AnyCancellable> = []

    @Published var state: MainViewViewState = .none
    @Published var query: String = ""
    
    func prepare(with presener: MainPresenterProtocol) {
        self.presenter = presener
        self.subs()
    }
    
    func didTapShowMoreButton() {
        presenter?.didTapShowMoreButton()
    }
    
    private func subs() {
        _query.projectedValue
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                guard let self else {
                    return
                }
                presenter?.didQueryChanged(query: value)
            }.store(in: &subscription)
    }
   
}

extension MainViewState: MainViewStateInputProtocol {
    
    @MainActor
    func set(state: MainViewViewState) {
        withAnimation {
            self.state = state
        }
    }
    
    @MainActor
    func reset() {
        withAnimation {
            query = ""
        }
    }
}
