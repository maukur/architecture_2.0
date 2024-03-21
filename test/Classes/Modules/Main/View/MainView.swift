//
//  MainView.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

struct MainView<T: MainViewStateOutputProtocol>: View {
           
    @StateObject var viewState: T

    var body: some View {
       
        VStack {
            HStack {
                Text("\(viewState.count)")
            }
            
            Button("Settings") {
                viewState.didTapNextButton()
            }
            
        }
    }
}

struct MainPreviews: PreviewProvider {
    static var previews: some View {
        ApplicationViewBuilder.stub.build(view: .main)
    }
}

