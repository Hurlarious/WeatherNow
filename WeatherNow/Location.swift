//
//  Location.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-27.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
