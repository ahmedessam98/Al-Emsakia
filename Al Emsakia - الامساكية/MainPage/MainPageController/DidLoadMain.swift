import Foundation
import UIKit

extension MainViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        city = defaults.string(forKey: "city") ?? ""
        country = defaults.string(forKey: "country") ?? ""
        
        if country == "" || city == "" {
            show(story: "SelectCC", VC: SelectCCViewController.self)
        }else {
            
        cityLabel.text = city
            
        print("country is \(country)")
        print("city is \(city)")
        
        fetchData(Country: country, City: city)
        
        }
    }
}
