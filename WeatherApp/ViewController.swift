//
//  ViewController.swift
//  WeatherApp
//
//  Created by Влад Голосков on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    var weatherList: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeather("Норильск", "RU")
    }
}

