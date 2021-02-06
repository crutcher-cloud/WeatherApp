//
//  Extensions.swift
//  WeatherApp
//
//  Created by Влад Голосков on 06.02.2021.
//

import UIKit

extension UIViewController {
    //Функция отображающая UIAlertView
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
