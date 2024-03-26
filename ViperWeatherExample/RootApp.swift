//
//  RootApp.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

@main
class RootApp: App {
    
    @ObservedObject var appViewBuilder: ApplicationViewBuilder
    @ObservedObject var navigationService: NavigationService
    
    let container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        
        
        // Services
        container.apply(NavigationAssembly.self)
        container.apply(OpenWeathetServiceAssembly.self)

        // Modules
        container.apply(MainAssembly.self)
        container.apply(WeatherDetailsAssembly.self)

        return container
    }()

    required init() {
        navigationService = container.resolve(NavigationAssembly.self).build() 
        
        appViewBuilder = ApplicationViewBuilder(container: container)
    }
    
    
    var body: some Scene {
        WindowGroup {
            RootView(navigationService: navigationService,
                     appViewBuilder: appViewBuilder)
        }
    }
    
    
}
