//
//  ViewController.swift
//  PokemonGo
//
//  Created by Jeferson Bujaico on 5/14/19.
//  Copyright © 2019 JeffRay. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var ubicacion = CLLocationManager()
    var contActualizaciones:Double = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {(timer) in
                if let coord = self.ubicacion.location?.coordinate{
                    let pin = MKPointAnnotation()
                    pin.coordinate = coord
                    self.mapView.addAnnotation(pin)
                }
            })
        } else {
            
            ubicacion.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (contActualizaciones < 1 ) {
            let region = MKCoordinateRegion(center: ubicacion.location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        } else {
            ubicacion.stopUpdatingLocation()
        }
    }
    
    @IBAction func centrarTapped(_ sender: Any) {
        if let coord = ubicacion.location?.coordinate {
            let region = MKCoordinateRegion(center: coord, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
    }
}

