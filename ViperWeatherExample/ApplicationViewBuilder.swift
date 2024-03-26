//
//  ApplicationViewBuilder.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

final class ApplicationViewBuilder : MainActorAssembly, ObservableObject {
    
    required init(container: Container) {
        super.init(container: container)
    }
   
    @ViewBuilder
    func build(view: Views) -> some View {
        switch view {
        case .main:
            buildMain()
        case .weatherDetails(let weather, let didReset):
            buildSettings(weather: weather, didReset: didReset)
        }
    }
    
    @ViewBuilder
    fileprivate func buildMain() -> some View {
        container.resolve(MainAssembly.self).build()
    }  
    
    @ViewBuilder
    fileprivate func buildSettings(weather: WeatherData, didReset: (()->Void)?) -> some View {
        container.resolve(WeatherDetailsAssembly.self).build(weather: weather, didReset: didReset)
    }
    
}

extension ApplicationViewBuilder {
    
    static var stub: ApplicationViewBuilder {
        return ApplicationViewBuilder(
            container: RootApp().container
        )
    }
}
