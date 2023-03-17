//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Artem on 2023-02-26.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                            
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.caption)
                    
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
