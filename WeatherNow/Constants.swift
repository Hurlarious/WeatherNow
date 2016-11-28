//
//  Constants.swift
//  WeatherNow
//
//  Created by Dave Hurley on 2016-11-26.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "7b48955e32a557653382177ea92503f3"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=7b48955e32a557653382177ea92503f3"

typealias DownloadComplete = () -> ()


