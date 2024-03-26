//
//  NavigationServiceType.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

@MainActor protocol NavigationServiceType: AnyObject, ObservableObject, Identifiable {
    var items:[Views] { get set }
    var modalView: Views? { get set }
}
