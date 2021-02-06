//
//  ViewController.swift
//  WeatherApp
//
//  Created by Влад Голосков on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
   
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var timeOfDay: UILabel!
   
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windSpeedValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        humidityLabel.isHidden = true
        humidityValue.isHidden = true
        
        windSpeedLabel.isHidden = true
        windSpeedValue.isHidden = true

        getWeather("Москва", "RU", completion: showUI)
    }
}

