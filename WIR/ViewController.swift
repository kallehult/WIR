//
//  ViewController.swift
//  WIR
//
//  Created by Karl Annerhult on 2015-08-16.
//  Copyright (c) 2015 Karl Annerhult. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var remindAtRain : UISwitch!
    @IBOutlet var remindAtSun : UISwitch!
    @IBOutlet var remindAtTime : UIDatePicker!
    @IBOutlet var city : UITextField!
    
    //@IBOutlet weak var latitude: UILabel!
    //@IBOutlet weak var longitude: UILabel!
    
    let userSettings = UserSettingsModel()
    
    let locationManager = CLLocationManager()
    
    func refreshUI() {
        remindAtRain.setOn(userSettings.remindAtRain, animated: true)
        remindAtSun.setOn(userSettings.remindAtSun, animated: true)
        remindAtTime.setDate(userSettings.remindAtTime, animated: true)
        city.text = userSettings.city
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        //println(self.locationManager.location)
        
        refreshUI()
    }
    
    
    
    
    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]
        self.locationManager.stopUpdatingLocation()
        
        println("Lat: \(latestLocation.coordinate.latitude)")
        println("Longitude: \(latestLocation.coordinate.longitude)")
        
        println("Lat set allready: \(userSettings.latitude)")
        
        userSettings.saveLongitudeAndLatitude(latestLocation.coordinate.longitude, latitude: latestLocation.coordinate.latitude)
        
        //latitude.text = String(format: "%.4f",
        //    latestLocation.coordinate.latitude)
        //longitude.text = String(format: "%.4f",
        //    latestLocation.coordinate.longitude)
        //horizontalAccuracy.text = String(format: "%.4f",
        //    latestLocation.horizontalAccuracy)
        //altitude.text = String(format: "%.4f",
        //    latestLocation.altitude)
        //verticalAccuracy.text = String(format: "%.4f",
        //    latestLocation.verticalAccuracy)
        
        
        //if startLocation == nil {
        //    startLocation = latestLocation as! CLLocation
        //}
        
        //var distanceBetween: CLLocationDistance =
        //latestLocation.distanceFromLocation(startLocation)
        
        //distance.text = String(format: "%.2f", distanceBetween)
    }
    
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!) {
            
    }
    
    
    
    
    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func remindAtRainChanged(sender : AnyObject) {
        userSettings.changeRemindAtRain(remindAtRain.on)
    }

    @IBAction func remindAtSunChanged(sender : AnyObject) {
        userSettings.changeRemindAtSun(remindAtSun.on)
    }
    
    @IBAction func remindAtTimeChanged(sender : AnyObject) {
        userSettings.changeRemindAtTime(remindAtTime.date)
    }
    
    @IBAction func cityChanged(sender : AnyObject) {
        userSettings.changeCity(city.text)
    }

}

