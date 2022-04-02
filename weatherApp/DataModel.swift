//
//  DataModel.swift
//  weatherApp
//
//  Created by 이로운 on 2022/04/02.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
    //let visibility: Int
    //let sys: Sys
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

/*
struct Sys: Decodable {
    let sunrise: String
    let sunset: String
}
*/
