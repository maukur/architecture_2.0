//
//  SettingsViewState.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class SettingsViewState: ObservableObject, SettingsViewStateProtocol {
    func execute() {
        presenter?.execute()
    }
    
    private let id = UUID()
    private var presenter: SettingsPresenterProtocol?
    
    func set(with presener: SettingsPresenterProtocol) {
        self.presenter = presener
    }
}
