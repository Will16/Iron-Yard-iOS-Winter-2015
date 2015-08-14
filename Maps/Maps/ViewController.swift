//
//  ViewController.swift
//  Maps
//
//  Created by William McDuff on 2015-02-02.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

// Homework 

// - make the map view show your current location (not as an annotation, but as the blue dot)
// - make the "annotation view" show using "title" on an annotation (make the title be the name of the venue)
// - make the mapview zoom to the annotations (maybe look for a region)
// - change the pin color


// hints: red dot is the locationview based on the location (override specific method to change pin color))

import UIKit
import MapKit
import CoreLocation

var onceToken: dispatch_once_t = 0

import UIKit
import MapKit
class NewAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String = ""
    var subtitle: String = ""
    init(location coord:CLLocationCoordinate2D) {
        self.coordinate = coord
        super.init()
    }
}
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    
     var lManager = CLLocationManager()
    var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.mapView.delegate = self
        
        mapView.frame = view.frame
        
        view.addSubview(mapView)

        
        lManager.requestWhenInUseAuthorization()
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        
        lManager.distanceFilter = kCLDistanceFilterNone

        lManager.startUpdatingLocation()
    
    }

   
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
         mapView.showsUserLocation = true
        
        // must pass the pointer in a parameter, so that when it changes in a method, it changes the global variable onceToken
        
        // GOAL: ONLY PRINT LOCATIONS ONCE (ONE REQUEST TO FOURSQUARE INSTEAD OF MANY)
        dispatch_once(&onceToken) {() -> Void in
            println(locations.last)
            
            // ? after as or after CLLocation is the same
            if let location = locations.last as? CLLocation {
                
                // request to foursquare for venues with location
                
                // how to zoom to and move to location
//              self.mapView.centerCoordinate = location.coordinate
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
                
                /*
                MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
                
                annotation.title = @"Marker";
                annotation.subtitle = @"This is a marker";
                
                [myMapView addAnnotation:annotation];
*/

              //  var annotation = Ma
                let venues = FourSquareRequest.requestVenuesWithLocation(location)
                
               

                
             
                self.createAnnotationsWithVenues(venues)
                
                var annotationArray = self.mapView.annotations
                self.mapView.showAnnotations(annotationArray, animated: true)
                
            }
            
            
            
        }
        
        
        
        lManager.stopUpdatingLocation()
    }
    
    func createAnnotationsWithVenues(venues: [AnyObject]) {
        // every venue is an array of dict
        for venue in venues as [[String:AnyObject]] {
            
            let locationName = venue["name"] as String
            
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let lat = locationInfo["lat"] as CLLocationDegrees
            let lng = locationInfo["lng"] as CLLocationDegrees
            
            let coordinate = CLLocationCoordinate2DMake(lat, lng)
       
            
           // let annotationView = MKAnnotationView()
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            annotation.title = locationName
        
     //       annotationView.annotation = annotation
        
            
         //   self.mapView(mapView, annotation: annotation)
            mapView.addAnnotation(annotation)
            
        }
    }
    
  
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
           

        }
        else {
            pinView!.annotation = annotation
        }
        
          pinView!.draggable = true
        
        // A Boolean value indicating whether the annotation view is able to display extra information in a callout bubble.
        pinView!.canShowCallout = true
        return pinView
    
    }

    func mapView(_mapView: MKMapView!, annotation: MKAnnotation!) -> MKAnnotationView! {
            
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                return nil
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = .Purple
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
    }

    
    
    /*

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
[myMapView removeAnnotations:myMapView.annotations];

for (CLLocation * location in locations)
{
MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];

annotation.title = @"Marker";
annotation.subtitle = @"This is a marker";

[myMapView addAnnotation:annotation];

//        [mapView setCenterCoordinate:location.coordinate animated:YES];

MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));

[myMapView setRegion:region animated:YES];

//        [mapView selectAnnotation:annotation animated:YES];

//        NSLog(@"%@",location);
 


// The CLGeocoder class provides services for converting between a coordinate (specified as a latitude and longitude) and the user-friendly representation of that coordinate. A user-friendly representation of the coordinate typically consists of the street, city, state, and country information corresponding to the given location, but it may also contain a relevant point of interest, landmarks, or other identifying information.
CLGeocoder * geoCoder = [[CLGeocoder alloc] init];

// completionHandlerA block object containing the code to execute at the end of the request.
[geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {

for (CLPlacemark *placemark in placemarks)
{
NSLog(@"%@",placemark);

NSString *cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];

[annotation setTitle:cityState];
[annotation setSubtitle:placemark.country];
}

}];

}
//    [lManager stopUpdatingLocation];
}


*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

