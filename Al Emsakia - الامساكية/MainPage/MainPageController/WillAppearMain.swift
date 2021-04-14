import Foundation
import UIKit

extension MainViewController {
    
    override func viewDidLoad() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        startA7adethTimer()
        
    }
    
    override open var shouldAutorotate: Bool {
            return false
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        city = defaults.string(forKey: "city") ?? ""
        country = defaults.string(forKey: "country") ?? ""
        
        if country == "" || city == "" {
            showFull(story: "SelectCC", VC: SelectCCViewController.self)
        }else {
            
            cityLabel.text = city
            fetchData(Country: country, City: city)
    }
        timerT = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getTimeOfDate), userInfo: nil, repeats: true)
  }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerT?.invalidate()
    }
    
}
