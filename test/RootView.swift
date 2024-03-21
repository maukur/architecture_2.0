//
//  RootView.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var navigationService: NavigationService
    @ObservedObject var appViewBuilder: ApplicationViewBuilder
    
    var body: some View {
        NavigationStack(path: $navigationService.items) {
            appViewBuilder.build(view: .main)
                .navigationDestination(for: Views.self) { path in
                    appViewBuilder.build(view: path)
                }
        }
        .fullScreenCover(isPresented: .constant($navigationService.modalView.wrappedValue != nil)) {
            if let modal = navigationService.modalView {
                switch modal {
                default:
                    fatalError()
                }
            }
        }
        .alert(isPresented: .constant($navigationService.alert.wrappedValue != nil)) {
            switch navigationService.alert {
            case .defaultAlert(let yesAction, let noAction):
                return Alert(title: Text("Title"),
                             primaryButton: .default(Text("Yes"), action: yesAction),
                             secondaryButton: .destructive(Text("No"), action: noAction))
            case .none:
                fatalError()
            }
        }
        
    }
}
