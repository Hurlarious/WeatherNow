//
//  WeatherViewController.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-26.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables/Properties/Outlets

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()

    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
    }
    
    // MARK: - TableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
            
        } else {
            
            return WeatherCell()
        }
    }

    
    // MARK: - Functions
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
                
            }
            completed()
        }
    }
    
    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        locationLabel.text = currentWeather.cityName
        currentWeatherLabel.text = currentWeather.weatherType
        
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }


}

