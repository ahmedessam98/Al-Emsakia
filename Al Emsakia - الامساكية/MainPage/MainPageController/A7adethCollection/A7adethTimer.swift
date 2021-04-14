import Foundation
import UIKit

extension MainViewController {
    
    func startA7adethTimer() {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    
    @objc func moveToNextIndex() {
        
        if currentCellIndex < a7adeth.count - 1 {
            currentCellIndex += 1
        }else {currentCellIndex = 0 }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}
