//
//  SettingsView.swift
//  test
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

struct SettingsView<T: SettingsViewStateProtocol>: View {
           
    @StateObject var viewState: T
    
    var body: some View {
        VStack {
            Spacer()
            Button("Exexute") {
                viewState.execute()
            }
            Spacer()
        }
    }
}

struct SettingsPreviews: PreviewProvider {
    static var previews: some View {
        ApplicationViewBuilder.stub.build(view: .settings { })
    }
}

