import Foundation
import UIKit
import CoreLocation

extension SelectCCViewController :CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations.last!
        
        if lastLocation.horizontalAccuracy < 0 {
            return
        }
        // if it location is nil or it has been moved
        if location == nil || location!.horizontalAccuracy > lastLocation.horizontalAccuracy {
            
            location = lastLocation
            // stop location manager
            stopLocationManager()

            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
             
                    if error == nil, let placemark = placemarks, !placemark.isEmpty {
                        self.placemark = placemark.last
                    }
                
                    self.parsePlacemarks()

               })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        stopLocationManager()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied){
            showLocationDisabledpopUp()
        }
    }

    
}
