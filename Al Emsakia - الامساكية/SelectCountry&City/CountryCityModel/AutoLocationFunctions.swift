import Foundation
import UIKit
import CoreLocation

extension SelectCCViewController {
    
    //Delegate function of location usage
    func startLocationManager() {
        // always good habit to check if locationServicesEnabled
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func stopLocationManager() {
       locationManager.stopUpdatingLocation()
       locationManager.delegate = nil
    }
    

    //Alert of failure enabling location
    func showLocationDisabledpopUp() {
        let alertController = UIAlertController(title: "Background Location Access  Disabled", message: "We need your location", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let openAction = UIAlertAction(title: "Open Setting", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func parsePlacemarks() {
        if let _ = location {
             // unwrap the placemark
             if let placemark = placemark {

                 if let city = placemark.locality, !city.isEmpty {
                     self.city = city
                 }
                 if let country = placemark.country, !country.isEmpty {
                     self.country = country
                 }
                 if let countryShortName = placemark.isoCountryCode, !countryShortName.isEmpty {

                     self.countryShortName = countryShortName
                 }
                
                if city != "" || country != "" {
                AutoCCLabel.text = "\(city),\(country)"
                }

         } else {
            // add some more check's if for some reason location manager is nil
            
         }

     }
    }

    
    
}
