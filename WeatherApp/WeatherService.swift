//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Влад Голосков on 29.11.2020.
//

import Foundation
import Alamofire

extension ViewController {
    func getWeather(_ city: String, _ lang: String) {
        let requestParameters = ["q": city, "lang": lang, "units": "metric", "appid": "bf30a4d5fcdd346f77adfbd891f586c8"]
        
        AF.request("https://api.openweathermap.org/data/2.5/forecast", parameters: requestParameters).responseData(completionHandler: { [self](response) in
            switch response.result {
            case .failure(let error):
                showAlert(title: "Ошибка", message: "Не удалось загрузить погодные данные", buttonText: "OK")
                print(error.localizedDescription)
            case .success(let data):
                do{
                    let weatherData = try JSONDecoder().decode(WeatherAPIResponse.self, from: data)
                    
                    //Внесение загруженных с api.openweathermap.org в UI
                    self.temperature.text = "\(lroundf(weatherData.list[0]?.main?.temp ?? 0))°"
                    self.weatherDescription.text = weatherData.list[0]?.weather[0]?.description
                    self.city.text = weatherData.city?.name
                    self.humidity.text = "\(weatherData.list[0]?.main?.humidity ?? 0)%"
                    self.windSpeed.text = "\(lroundf(weatherData.list[0]?.wind?.speed ?? 0)) м/с"
                    
                    //Внесение полученного списка погоды в массив weatherList
                    for weather in weatherData.list {
                        self.weatherList.append(weather!)
                    }
                } catch {
                    showAlert(title: "Ошибка", message: "Не удалось загрузить погодные данные", buttonText: "OK")
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
