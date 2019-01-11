//
//  MapViewController.swift
//  hackathon
//
//  Created by Soma on 11/16/18.
//  Copyright © 2018 Soma. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled(){
//
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
//
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if(CLLocationManager.locationServicesEnabled()){
            setupLocation()
            checkLocationAuthorization()
        }else{
            print("it is not enabled")
        }
        
    }
    
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            centerViewOnUserLocation()
            //do map stuff
            break
        case .denied:
            //show alert how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //show an alert letting them know what's up
          break
        case .authorizedAlways:
            break
        }
    }
    
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
//            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            
            
            
           // map.setRegion(region, animated: true)
        }
    }
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locvalue:CLLocationCoordinate2D = manager.location!.coordinate

        let userlocation = locations.last
        let viewRegion = MKCoordinateRegionMakeWithDistance((userlocation?.coordinate)!, 600, 600)
        self.map.setRegion(viewRegion, animated:  true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


