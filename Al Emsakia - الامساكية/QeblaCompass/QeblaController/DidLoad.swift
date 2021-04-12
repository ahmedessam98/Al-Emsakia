import Foundation
import UIKit

extension QeblaViewController {
    
    override func viewDidLoad() {
      super.viewDidLoad()
      locationManager.delegate = locationDelegate
      
      locationDelegate.locationCallback = { location in
        self.latestLocation = location
      }
      
      locationDelegate.headingCallback = { newHeading in
        
        func computeNewAngle(with newAngle: CGFloat) -> CGFloat {
          let heading: CGFloat = {
            let originalHeading = self.yourLocationBearing - newAngle.degreesToRadians
            switch UIDevice.current.orientation {
            case .faceDown: return -originalHeading
            default: return originalHeading
            }
          }()
          
          return CGFloat(self.orientationAdjustment().degreesToRadians + heading)
        }
        
        UIView.animate(withDuration: 0.5) {
          let angle = computeNewAngle(with: CGFloat(newHeading))
          self.imageView.transform = CGAffineTransform(rotationAngle: angle)
        }
      }
    }
}
