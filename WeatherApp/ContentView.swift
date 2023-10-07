//
//  ContentView.swift
//  WeatherApp
//
//  Created by Maycon Douglas on 05/10/23.
//

import SwiftUI

struct ContentView: View {
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
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                Text("São Cristóvão - SE")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("30°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                    
                }
                .padding(.bottom, 40)
                
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
                    print("clicado")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
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
                .renderingMode(.original)
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
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
