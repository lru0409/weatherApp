//
//  ViewController.swift
//  weatherApp
//
//  Created by 이로운 on 2022/04/02.
//

import UIKit

class ViewController: UIViewController {
    
    var weather: Weather?
    var main: Main?
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService().getWeather { result in
            switch result {
                case .success(let weatherResponse):
                    DispatchQueue.main.async {
                        self.weather = weatherResponse.weather.first
                        self.main = weatherResponse.main
                        self.name = weatherResponse.name
                    }
                case .failure(_ ):
                    print("error")
            }
            
        }
        
    }


}

