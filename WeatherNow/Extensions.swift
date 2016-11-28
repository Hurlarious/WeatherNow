//
//  Extensions.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-27.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation
import UIKit



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
