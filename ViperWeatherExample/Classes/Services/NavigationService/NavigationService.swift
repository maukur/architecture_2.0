//
//  NavigationService.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//


import SwiftUI

public class NavigationService: NavigationServiceType  {
    
    public let id = UUID()
    
    public static func == (lhs: NavigationService, rhs: NavigationService) -> Bool {
        lhs.id == rhs.id
    }
    
    @Published var modalView: Views?
    @Published var items: [Views] = []
}


enum Views: Equatable, Hashable {
    
    static func == (lhs: Views, rhs: Views) -> Bool {
        lhs.stringKey == rhs.stringKey
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.stringKey)
    }
    
    case main
    case weatherDetails(weather:WeatherData, didReset: (()->Void)?)
    
    var stringKey: String {
        switch self {
        case .main:
            return "main"
        case .weatherDetails:
            return "weatherDetails"
        }
    }
}


class StubNavigation: NavigationServiceType, ObservableObject, Equatable  {
    @Published var modalView: Views?
    
    public let id = UUID()
    
    public static func == (lhs: StubNavigation, rhs: StubNavigation) -> Bool {
        lhs.id == rhs.id
    }
    
    fileprivate init() {}
    
    static var stub: any NavigationServiceType { NavigationService() }
    
    @Published var items: [Views] = []
}
