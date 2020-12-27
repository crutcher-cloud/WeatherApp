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
    @IBOutlet weak var weatherIcon: UIImageView!
   
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var timeOfDay: UILabel!
   
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeather("Норильск", "RU")
    }
}

