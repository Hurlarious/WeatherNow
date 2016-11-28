//
//  Forecast.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-27.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Forecast {
    
    // MARK: - Variables
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String! {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String! {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String! {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String! {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    // MARK: - Initializers
    
    init(weatherDict: Dictionary<String, AnyObject>) {
  
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                //let kelvinToCelcius = round(10 * (min - 273.15)/10)
                let kelvinToCelcius = (min - 273.15).roundTo(places: 1)
                self._lowTemp = "\(kelvinToCelcius)"
            }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToCelcius = (max - 273.15).roundTo(places: 1)
                self._highTemp = "\(kelvinToCelcius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixDate.dayOfWeek()
            
        }
        
    }
    
}


extension Date {
    
    func dayOfWeek() -> String {
         
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

extension Double {
    
    func roundTo(places:Int) -> Double {
        
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}









