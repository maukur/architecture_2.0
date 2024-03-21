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
        VStack(alignment: .center) {
            TextField(text: $viewState.query) {
                Text("Enter the text here")
            }
            .padding()
            .border(.gray)
            .presentationCornerRadius(10)
            .padding()
            Spacer()
            switch viewState.state {
            case .error(let error):
                Text(error)
            case .show(let weater):
                VStack {
                    Text(weater)
                    Button("Show More") {
                        viewState.didTapShowMoreButton()
                    }
                }
            case .none:
                Text("NO DATA")
            }
            Spacer()
        }
    }
}

struct MainPreviews: PreviewProvider {
    static var previews: some View {
        return ApplicationViewBuilder.stub.build(view: .main)
    }
}

