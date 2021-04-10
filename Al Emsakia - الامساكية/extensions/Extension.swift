import Foundation
import UIKit

extension UIViewController {
    
    func show<vc:UIViewController>(story:String,VC:vc.Type) {
        
        let identifier = String(describing: vc.self)
        if let story = UIStoryboard(name: story, bundle: nil).instantiateViewController(withIdentifier: identifier) as? vc {
            story.modalPresentationStyle = .fullScreen
            present(story, animated: true, completion: nil)
        }
    }
    
}
