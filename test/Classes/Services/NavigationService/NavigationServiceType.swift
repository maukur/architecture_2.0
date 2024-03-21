//
//  NavigationServiceType.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import Foundation

protocol NavigationServiceType: ObservableObject, Identifiable {
    var items:[Views] { get set }
    var modalView: Views? { get set }
    var alert: CustomAlert? { get set }
}
