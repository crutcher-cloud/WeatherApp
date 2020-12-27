//
//  Controller.swift
//  WeatherApp
//
//  Created by Влад Голосков on 01.12.2020.
//

import Foundation
import UIKit

extension ViewController {
    //Функция отображающая UIAlertView
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //Функция, устанавливающая Месяц и День, полученные от api в UI
    func setDayInfo(dateString: String, timeOfDay: String) {
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
        
        if timeOfDay == "d" {
            self.timeOfDay.text = "День"
        } else {
            self.timeOfDay.text = "Ночь"
        }
    }
    
    func setImageFromURL(imageCode: String) {
        let url = URL(string: "https://openweathermap.org/img/wn/\(imageCode)@2x.png")
        do {
            let data = try Data(contentsOf: url!)
            self.weatherIcon.image = UIImage(data: data)
        } catch {
            print("Ошибка: \(error.localizedDescription)")
        }
    }
}
