//
//  OpenWeathetServiceAssembly.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//	
//

import Foundation

class OpenWeathetServiceAssembly: Assembly {
    func build() -> OpenWeathetServiceType {
        let service = OpenWeathetService()
        return service
    }
}
