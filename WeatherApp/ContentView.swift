//
//  ContentView.swift
//  WeatherApp
//
//  Created by Maycon Douglas on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight =  false
    
    struct WeatherItem {
        let day: String
        let iconName: String
        let temperature: Int
    }
    
    let weatherData: [WeatherItem] = [
        WeatherItem(day: "TER", iconName: "cloud.sun.fill", temperature: 30),
        WeatherItem(day: "QUA", iconName: "sun.max.fill", temperature: 25),
        WeatherItem(day: "QUI", iconName: "wind", temperature: 28),
        WeatherItem(day: "SEX", iconName: "sunset.fill", temperature: 28),
        WeatherItem(day: "SÁB", iconName: "moon.stars.fill", temperature: 28)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityText: "São Cristóvão - SE")
                
                MainWeatherStatusView(iconName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 30)
                
                HStack(spacing: 20) {
                    ForEach(weatherData, id: \.day) { weatherItem in
                        WeatherDayView(
                            dayOfWeek: weatherItem.day,
                            iconName: weatherItem.iconName,
                            temperature: weatherItem.temperature
                        )
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        backgroundColor: .white,
                        textColor: Color.blue
                    )
                }
                
                Spacer()
            }
        }
        
    }
}



#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: iconName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue") ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityText: String
    
    var body: some View {
        Text(cityText)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
            
        }
        .padding(.bottom, 40)
    }
}


