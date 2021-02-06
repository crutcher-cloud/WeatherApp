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
    
    var defaultCity: String = {
        //Установка значения города из UserDefaults
        let def = UserDefaults()
        guard def.value(forKey: "defaultCity") != nil else {
            return "Москва"
        }
        return def.value(forKey: "defaultCity") as! String
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        humidityLabel.isHidden = true
        humidityValue.isHidden = true
        
        windSpeedLabel.isHidden = true
        windSpeedValue.isHidden = true

        getWeather(defaultCity, "RU")
    }
}

