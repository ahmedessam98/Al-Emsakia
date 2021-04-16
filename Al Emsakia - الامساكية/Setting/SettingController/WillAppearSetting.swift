import Foundation
import UIKit

extension SettingViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
 
        azanSegment.isOn = vc.defaults.bool(forKey: "azanStatus")
        
        if vc.defaults.integer(forKey: "method") == 4 {
            methodTextField.text = salaMethods[0]
        }else if vc.defaults.integer(forKey: "method") == 1 {
            methodTextField.text = salaMethods[1]
        }else if vc.defaults.integer(forKey: "method") == 5 {
            methodTextField.text = salaMethods[2]
        }else if vc.defaults.integer(forKey: "method") == 2 {
            methodTextField.text = salaMethods[3]
        }else if vc.defaults.integer(forKey: "method") == 3 {
            methodTextField.text = salaMethods[4]
        }else if vc.defaults.integer(forKey: "method") == 13 {
            methodTextField.text = salaMethods[5]
        }else if vc.defaults.integer(forKey: "method") == 12 {
            methodTextField.text = salaMethods[6]
        }else if vc.defaults.integer(forKey: "method") == 14 {
            methodTextField.text = salaMethods[7]
        }else {
            methodTextField.text = salaMethods[0]
        }
        
    }
    

    
}
