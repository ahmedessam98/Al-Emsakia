import Foundation
import UIKit
import AVFoundation

extension UIViewController {
    
    func showFull<vc:UIViewController>(story:String,VC:vc.Type) {
        
        let identifier = String(describing: vc.self)
        if let story = UIStoryboard(name: story, bundle: nil).instantiateViewController(withIdentifier: identifier) as? vc {
            story.modalPresentationStyle = .fullScreen
            present(story, animated: true, completion: nil)
        }
    }
    
    func show<vc:UIViewController>(story:String,VC:vc.Type) {
        
        let identifier = String(describing: vc.self)
        if let story = UIStoryboard(name: story, bundle: nil).instantiateViewController(withIdentifier: identifier) as? vc {
            
            present(story, animated: true, completion: nil)
        }
    }
    
}
