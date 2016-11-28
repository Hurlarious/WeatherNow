//
//  WeatherCell.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-27.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        dayLabel.text = forecast.date
        weatherType.text = forecast.weatherType
        highTemp.text = forecast.highTemp
        lowTemp.text = forecast.lowTemp
        
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }

}
