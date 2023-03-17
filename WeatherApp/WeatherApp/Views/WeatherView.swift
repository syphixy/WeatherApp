//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Artem on 2023-02-26.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    func button() {
        print("Redirected from button")
    }
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather [0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    
                    ZStack {
                        HStack {
                            Button(action: {
                            button()
                            if let yourURL = URL(string: "https://www.youtube.com/watch?v=xvFZjo5PgG0") {
                                    UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                                }
                        })   {
                                Image("Cool")
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(100)
                                
                                
                            
                                                       }
                            
                         }
                        }
                        
                    
                    
                    AsyncImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/551a19f8e4b0e8322a93850a/1551120740921-JRKB12UYCCJTJ1E1MREK/Title_Image_Day.png")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350)
                                                .padding()
                                                .cornerRadius(100)
                                                
                                        } placeholder: {
                                            ProgressView()
                                        }
                                Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.medium", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.medium", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack(spacing: 35) {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            
                        Spacer()
                        
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                            .offset(x: 5.8)
                    }
                }
                
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.706, saturation: 0.975, brightness: 0.942))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.706, saturation: 0.975, brightness: 0.942))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather:previewWeather)
    }
}
