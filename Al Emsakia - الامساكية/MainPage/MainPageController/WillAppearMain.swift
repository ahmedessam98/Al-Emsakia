import Foundation
import UIKit
import SystemConfiguration

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
        salaMethod = defaults.integer(forKey: "method")
        azanStatus = defaults.bool(forKey: "azanStatus")
        
        if country == "" || city == "" {
            showFull(story: "SelectCC", VC: SelectCCViewController.self)
        }else {
            
            cityLabel.text = city
            if MainViewController.isConnectedToNetwork(){
                print("Internet Connection Available!")
                fetchData(Country: country, City: city)
            }else{
                print("Internet Connection not Available!")
                //1. Creat alert
                    let alert = UIAlertController(title: "No Internet Connection", message: "", preferredStyle: .alert)
                    
                //2. Creat action
                    let cancell = UIAlertAction(title: "Cancell", style: .default, handler: nil)
                    
                //3. add action to alert
                    alert.addAction(cancell)
                    
                //4. present the alert
                    present(alert, animated: true, completion: nil)
            }

    }
        timerT = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getTimeOfDate), userInfo: nil, repeats: true)
  }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerT?.invalidate()
    }
    
}
