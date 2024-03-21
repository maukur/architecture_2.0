//
//  MainViewState.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//
import SwiftUI

final class MainViewState: MainViewStateInputProtocol, MainViewStateOutputProtocol {

    @MainActor
    func increase() {
        withAnimation {
            count += 1
        }
    }
    
    @MainActor
    func decrease() {
        withAnimation {
            count -= 1
        }
    }
    
    @Published var count: Int = 0
  
    private var presenter: MainPresenterProtocol?
    
    func set(with presener: MainPresenterProtocol) {
        self.presenter = presener
    }
    
    func didTapNextButton() {
        presenter?.didTapNextButton()
    }
}



