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
    var visibility: Int?
    var sys: Sys?
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var sensibleTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService().getWeather { result in
            switch result {
                case .success(let weatherResponse):
                    DispatchQueue.main.async {
                        self.weather = weatherResponse.weather.first
                        self.main = weatherResponse.main
                        self.name = weatherResponse.name
                        self.visibility = weatherResponse.visibility
                        self.sys = weatherResponse.sys
                        
                        let imageURL = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "")@2x.png")
                        let data = try? Data(contentsOf: imageURL!)
                        if let data = data {
                            self.weatherIconImageView.image = UIImage(data: data)
                        }
                        
                        self.descriptionLabel.text = "날씨 설명 : \(self.weather?.description ?? "")"
                        self.currentTempLabel.text = "현재 기온 : \(Int(self.main?.temp ?? 0))"
                        self.maxTempLabel.text = "최고 기온 : \(Int(self.main?.temp_max ?? 0))"
                        self.minTempLabel.text = "최저 기온 : \(Int(self.main?.temp_min ?? 0))"
                        self.sunriseTimeLabel.text = "일출 시간 : \(self.sys?.sunrise)"
                        self.sunsetTimeLabel.text = "일몰 시간 : \(self.sys?.sunset)"
                        self.sensibleTempLabel.text = "체감 온도 : \(Int(self.main?.feels_like ?? 0))"
                        self.humidityLabel.text = "습도 : \(self.main?.humidity ?? 0)%"
                        self.visibilityLabel.text = "가시 거리 : \(self.visibility ?? 0)m"
                        
                    }
                case .failure(_ ):
                    print("error error")
            }
            
        }
        
    }


}

