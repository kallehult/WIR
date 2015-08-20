//
//  UserSettingsModel.swift
//  WIR
//
//  Created by Karl Annerhult on 2015-08-16.
//  Copyright (c) 2015 Karl Annerhult. All rights reserved.
//

import Foundation

class UserSettingsModel {
    var remindAtTime : NSDate
    var remindAtRain : Bool
    var remindAtSun : Bool
    var city : String
    var longitude : Double
    var latitude : Double
    
    let storedSettings = NSUserDefaults.standardUserDefaults()
    
    init() {
        if (storedSettings.objectForKey("storedRemindAtTime") != nil) {
            remindAtTime = storedSettings.objectForKey("storedRemindAtTime") as! NSDate
        } else {
            remindAtTime = NSDate()
        }

        remindAtRain = storedSettings.boolForKey("storedRemindAtRain")
        remindAtSun = storedSettings.boolForKey("storedRemindAtSun")
        city = ""
        if (storedSettings.stringForKey("storedCity") != nil) {
            city = storedSettings.stringForKey("storedCity")!
        }
        
        longitude = storedSettings.doubleForKey("storedLongitude")
        latitude = storedSettings.doubleForKey("storedLatitude")
        
    }
    
    func changeRemindAtRain(remindAtRain : Bool) {
        println("The remindAtRain in is \(remindAtRain)")
        storedSettings.setBool(remindAtRain, forKey: "storedRemindAtRain")
        let printThis = storedSettings.boolForKey("storedRemindAtRain")
        println("The stored setting for remind at rain is now \(printThis)")
    }
    
    func changeRemindAtSun(remindAtSun : Bool) {
        storedSettings.setBool(remindAtSun, forKey: "storedRemindAtSun")
    }
    
    func changeRemindAtTime(remindAtTime : NSDate) {
        storedSettings.setObject(remindAtTime, forKey: "storedRemindAtTime")
    }
    
    func changeCity(city : String) {
        println("Chnging city to \(city)")
        storedSettings.setObject(city, forKey: "storedCity")
    }
    
    func saveLongitudeAndLatitude(longitude : Double, latitude : Double) {
        storedSettings.setDouble(longitude, forKey: "storedLongitude")
        storedSettings.setDouble(latitude, forKey: "storedLatitude")
    }
}