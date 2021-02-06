//
//  Controller.swift
//  WeatherApp
//
//  Created by Влад Голосков on 01.12.2020.
//

import Foundation
import UIKit

extension ViewController {
    func showUI() {
        menuButton.isHidden = false
        
        temperature.isHidden = false
        weatherDescription.isHidden = false
        weatherIcon.isHidden = false
        
        city.isHidden = false
        day.isHidden = false
        timeOfDay.isHidden = false
        
        humidityLabel.isHidden = false
        humidityValue.isHidden = false
        
        windSpeedLabel.isHidden = false
        windSpeedValue.isHidden = false
        
        activityIndicator.stopAnimating()
    }
    
    //Функция отображающая UIAlertView
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //Функция, устанавливающая месяц и часть суток
    func setDayInfo(dateString: String) {
        let calendar = Calendar.current
        
        let customFormatter = DateFormatter()
        customFormatter.dateFormat = "yyyy'-'MM'-'dd' 'HH'-'mm'-'ss"
        
        let dateFromApi = customFormatter.date(from: dateString)
        
        let months = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

        guard let date = dateFromApi else {
            showAlert(title: "Внимание", message: "Произошла внутренняя ошибка, попробуйте повторить позже", buttonText: "OK")
            return
        }
        
        let day = "\(months[calendar.component(.month, from: date) - 1]), \(calendar.component(.day, from: date))"
        self.day.text = "\(day)"

        switch calendar.component(.hour, from: date) {
        case 4..<12:
            self.timeOfDay.text = "Утро"
        case 12..<17:
            self.timeOfDay.text = "День"
        case 17..<23:
            self.timeOfDay.text = "Вечер"
        default:
            self.timeOfDay.text = "Ночь"
        }
    }
    
    //Функция устанавливающая иконку погоды
    func setImageFromURL(imageCode: String) {
        let url = URL(string: "https://openweathermap.org/img/wn/\(imageCode)@2x.png")
        do {
            let data = try Data(contentsOf: url!)
            self.weatherIcon.image = UIImage(data: data)
        } catch {
            showAlert(title: "Ошибка", message: "Не удалось загрузить иконку, попробуйте повторить позже", buttonText: "ОК")
            print("Ошибка: \(error.localizedDescription)")
        }
    }
}
