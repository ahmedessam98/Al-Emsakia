import UIKit
import CoreLocation

class QeblaViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func backToMain(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    var yourLocationBearing: CGFloat { return latestLocation?.bearingToLocationRadian(self.yourLocation) ?? 0 }
    var yourLocation = CLLocation(latitude: 21.4225239, longitude: 39.8261816)
    
    let locationManager: CLLocationManager = {
      $0.requestWhenInUseAuthorization()
      $0.desiredAccuracy = kCLLocationAccuracyBest
      $0.startUpdatingLocation()
      $0.startUpdatingHeading()
      return $0
    }(CLLocationManager())
    
    func orientationAdjustment() -> CGFloat {
      let isFaceDown: Bool = {
        switch UIDevice.current.orientation {
        case .faceDown: return true
        default: return false
        }
      }()
      
      let adjAngle: CGFloat = {
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:  return 90
        case .landscapeRight: return -90
        case .portrait, .unknown: return 0
        case .portraitUpsideDown: return isFaceDown ? 180 : -180
        @unknown default:
            fatalError()
        }
      }()
      return adjAngle
    }
  }

