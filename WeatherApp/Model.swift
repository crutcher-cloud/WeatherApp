//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Влад Голосков on 29.11.2020.
//

import Foundation

struct WeatherAPIResponse: Decodable {
    let cod: String?
    let city: City?
    let list: [List?]
}

class City: Decodable {
    dynamic var id: Int? = 0
    dynamic var name: String? = ""
    dynamic var population: Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case population
    }
}

struct List: Decodable {
    let main: Main?
    let weather: [Weather?]
    let wind: Wind?
    
    let dateTime: String?
    
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case wind
        case dateTime = "dt_txt"
    }
}

class Weather: Decodable {
    dynamic var description: String?
    dynamic var icon: String?
}

class Main: Decodable {
    dynamic var temp: Float? = 0
    dynamic var humidity: Int? = 0
}

class Wind: Decodable {
    dynamic var speed: Float? = 0
}
