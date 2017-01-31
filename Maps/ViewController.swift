//
//  ViewController.swift
//  Maps
//
//  Created by Ahmed T Khalil on 1/11/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        //general idea is that we want to define a region to look at within our Map View
        //a region is made up of a location and a span
        //a location is made up of a latitude and a longitude
        //a span (zoom level) is made up of the increments (deltas) that your map should cover
        
        //latitude and longitude
        let lat: CLLocationDegrees = 40.7
        let lon: CLLocationDegrees = -73.9
        
        //create a location from this
        let loc: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        //create the increments for the span of the map
        let latDel: CLLocationDegrees = 0.05
        let lonDel: CLLocationDegrees = 0.05
        
        //create the span
        let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDel, longitudeDelta: lonDel)
        
        //finally create the region
        let region: MKCoordinateRegion = MKCoordinateRegion(center: loc, span: mapSpan)
        
        //NOTE: span and region affect the view and so they are MK, whereas location-related variables are all CL since they are not directly tied to the view; if you ever forget types, you can start by typing MKCoordinateRegion(... and the thing will remind you what goes into each
        
        //finally display the map by setting the region you defined
        map.setRegion(region, animated: true)
 
        */
        
        
        
        //trying the challenge with Egypt's coordinates 29.9681301,31.0826395
        
        let lat: CLLocationDegrees = 29.9681301
        let lon: CLLocationDegrees = 31.0826395
        let loc: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        let latDel: CLLocationDegrees = 0.05
        let lonDel: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDel, longitudeDelta: lonDel)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: loc, span: span)
        map.setRegion(region, animated: true)
        
        
        //To make an annotation (i.e. pin drop on map with text)
        //first create an annotation object
        let annotation = MKPointAnnotation()
        //then set where you want the annotation to be
        annotation.coordinate = loc
        //then add some text
        annotation.title = "Pyramids"
        //then add a description
        annotation.subtitle = "Located in Giza"
        //then, finally, you need to add the annotation to your map object
        map.addAnnotation(annotation)
        
        
        //to let the user add an annotation, we need to understand where they want to place the annotation. This is naturally done using a gesture recognizer (more precisely, we will be using a long press gesture recognizer...there are other gesture recognizers)
        //so first create a long press gesture recognizer
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(longpress(gestureRecognizer:)))
        
        //set the time for the long press
        uilpgr.minimumPressDuration = 2
        
        //then add it to your map
        map.addGestureRecognizer(uilpgr)
    }

    func longpress(gestureRecognizer: UIGestureRecognizer){
        //purpose of longpress is to convert our touch point to a coordinate
        //so first retrieve the touch point on the map
        let touchpoint = gestureRecognizer.location(in: self.map)
        //then convert this from a CGPoint to a usable coordinate on the map
        let coordinate = map.convert(touchpoint, toCoordinateFrom: self.map)
        
        //then just create an annotation as usual
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "Latitude: \(coordinate.latitude) Longitude: \(coordinate.longitude)"
        map.addAnnotation(annotation)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

