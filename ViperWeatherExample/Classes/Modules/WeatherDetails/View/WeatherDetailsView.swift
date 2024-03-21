//
//  WeatherDetailsView.swift
//  ViperWeatherExample
//
//  Created by Artem Tischenko on 3/22/24
//  
//

import SwiftUI

struct WeatherDetailsView<T: WeatherDetailsViewStateOutputProtocol>: View {
           
    @StateObject var viewState: T
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            if let weather = viewState.weather {
                Text("Name: \(weather.name)")
                Text("Temp: \(weather.main.temp)°F")
                Text("Humidity: \(weather.main.humidity)%")
                Button("Reset Search Query") {
                    viewState.didTapResetButton()
                }
            }
            if let closeTime = viewState.closeTime {
                Text("\(closeTime) SEC")
            }
            Spacer()
        }.onAppear {
            viewState.onAppear()
        }
    }
}
