//
//  ViewController.swift
//  Project16
//
//  Created by Hassan Sohail Dar on 30/10/2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let alice = Capital(title: "Alice Springs", coordinate: CLLocationCoordinate2D(latitude: -23.6980, longitude: 133.8807), info: "this is where the snakes come from.")
        let brisbane = Capital(title: "Brisbane", coordinate: CLLocationCoordinate2D(latitude: -27.4705, longitude: 153.0260), info: "noice and rainy.")
        /*
         mapView.addAnnotation(london)
         mapView.addAnnotation(oslo)
         mapView.addAnnotation(paris)
         mapView.addAnnotation(rome)
         mapView.addAnnotation(washington)
         */
        mapView.addAnnotations([london, oslo, paris, rome, washington, alice, brisbane])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }
        
        // 2
        let identifier = "Capital"
        
        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        let myAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        myAnnotationView.pinTintColor = .systemGreen
        if annotationView == nil {
            //4
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
        } else {
            // 6
            annotationView?.annotation = annotation
        }
        //        return MKPinAnnotationView(annotationView)
        
        return annotationView
        //        return annotationView
    }
    
    //    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    //        guard let capital = view.annotation as? Capital else { return }
    //        let placeName = capital.title
    //        let placeInfo = capital.info
    //
    //        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
    //        ac.addAction(UIAlertAction(title: "OK", style: .default))
    //        present(ac, animated: true)
    //
    //    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
//        let placeName = capital.title
//        let placeInfo = capital.info
//        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        //step 1 list an array of types of maps
        //step 2 show the list in UIAlertAction as separate buttons which are clickable.
        //step 3 , when pressed, call a closure that will change mapView mapType to the selected item.
        
        //        let arrayOfMayTypes = ["standard" : standard,
        //                               "hybrid" : hybrid, "satellite" : satellite,
        //                               "satelliteFlyover": satelliteFlyover]
        let arrayOfMayTypesText = ["standard" ,"hybrid", "satellite", "satelliteFlyover"]
        // standard / hybrid / satellite / satelliteFlyOver
        let ac2 = UIAlertController(title: "Terrain", message: "Choose the type of terrain", preferredStyle: .alert)
        for type in arrayOfMayTypesText {
            ac2.addAction(UIAlertAction(title: type, style: .default) { [weak  mapView, type] _ in
                switch(type) {
                case "standard":
                    mapView?.mapType = MKMapType.standard
                    break
                case "hybrid":
                    mapView?.mapType = MKMapType.hybrid
                    break
                case "satellite":
                    mapView?.mapType = MKMapType.satellite
                    break
                case "satelliteFlyover":
                    mapView?.mapType = MKMapType.satelliteFlyover
                    break
                default:
                    mapView?.mapType = MKMapType.standard
                    
                }
                
            })
            
        }
        present(ac2, animated: true)
        

    }
}


