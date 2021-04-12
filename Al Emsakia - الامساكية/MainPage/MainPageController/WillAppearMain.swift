import Foundation
import UIKit

extension MainViewController {
    
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
  }
    
}
