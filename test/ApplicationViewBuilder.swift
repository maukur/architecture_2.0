//
//  ApplicationViewBuilder.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

@MainActor
final class ApplicationViewBuilder : Assembly, ObservableObject {
    
    required init(container: Container) {
        super.init(container: container)
    }
   
    @ViewBuilder
    func build(view: Views) -> some View {
        switch view {
        case .main:
            buildMain()
        case .settings(let didClosed):
            buildSettings(didClosed: didClosed)
        }
    }
    
    @ViewBuilder
    fileprivate func buildMain() -> some View {
        container.resolve(MainAssembly.self).build()
    }  
    
    @ViewBuilder
    fileprivate func buildSettings(didClosed: (()->Void)?) -> some View {
        container.resolve(SettingsAssembly.self).build(didClosed: didClosed)
    }
    
}

extension ApplicationViewBuilder {
    
    static var stub: ApplicationViewBuilder {
        return ApplicationViewBuilder(
            container: RootApp().container
        )
    }
}
