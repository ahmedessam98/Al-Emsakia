import Foundation
import UIKit

extension QuranViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        savedPage = defaults.integer(forKey: "savedPage")
        pageIndex = defaults.integer(forKey: "pageIndex")
        
        containerView.isHidden = true
        quranPageImage.image = quranPages[pageIndex]
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if containerView.isHidden == true {
            containerView.isHidden = false
        }else {
            containerView.isHidden = true
        }
    }

}
