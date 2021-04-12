import Foundation
import UIKit

extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return a7adeth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "a7adethCell", for: indexPath) as! A7adethCollectionViewCell
        
        cell.a7adethLabel.text = a7adeth.randomElement()
        
        return cell
    }
    
    
    
    
}
