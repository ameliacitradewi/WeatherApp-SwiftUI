//
//  ContentView.swift
//  Weather App
//
//  Created by Amelia Citra on 14/05/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var searchText = ""
    @State private var otherTextFieldText = "New York"
    
    var weatherManager = WeatherManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            TextField("", text: $otherTextFieldText)
                                .bold()
                                .font(.title)
                                
                            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                        }
                        .padding(10)
                        
                        Spacer()
                        
                        Text("9°C")
                            .bold()
                            .font(.system(size: 60))
                            .padding(10)
                    }
                    
                    VStack {
                        Image("02fewclouds")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                        Text("Heavy Rain")
                            .font(.title)
                            .bold()
                    }
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Weather Details")
                                .bold()
                                .padding(.bottom)
                            
                            HStack {
                                WeatherRow(logo: "thermometer", name: "Min. Temp", value: "01")
                                Spacer()
                                WeatherRow(logo: "thermometer", name: "Max. Temp", value: "02")
                            }
                            
                            HStack {
                                WeatherRow(logo: "humidity", name: "Humidity", value: "03")
                                Spacer()
                                WeatherRow(logo: "wind", name: "Windspeed", value: "04")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom, 20)
                        .background(Color(red: 0.51, green: 0.80, blue: 0.87))
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(.white)
            .preferredColorScheme(.light)
            .searchable(text: $searchText, prompt: "Type your location here")
            .onSubmit(of: .search) {
                otherTextFieldText = searchText
                searchText = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
