//
//  MenuController.swift
//  WeatherApp
//
//  Created by Влад Голосков on 06.02.2021.
//

import UIKit

extension MenuViewController {
    
    func saveCity(city: String) {
        if !city.isEmpty {
            //Сохранение города по умолчанию в UserDefaults
            let defaults = UserDefaults()
            defaults.setValue(city, forKey: "defaultCity")
            
            performSegue(withIdentifier: "unwind", sender: nil)
        } else {
            showAlert(title: "Ошибка", message: "Поле 'Город' не может быть пустым", buttonText: "ОК")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ViewController else { return }
        //Загрузка ViewController на основном экране
        destinationVC.loadView()
        
        //Скрытие необходимых элементов
        destinationVC.humidityLabel.isHidden = true
        destinationVC.humidityValue.isHidden = true
        
        destinationVC.windSpeedLabel.isHidden = true
        destinationVC.windSpeedValue.isHidden = true
        
        //Загрузка обновленных погодных данных
        destinationVC.getWeather(defaultCityText.text!, "RU")
    }
    
}
