//
//  MenuViewController.swift
//  WeatherApp
//
//  Created by Влад Голосков on 06.02.2021.
//

import UIKit

class MenuViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var defaultCityText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultCityText.delegate = self
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        saveCity(city: defaultCityText.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
