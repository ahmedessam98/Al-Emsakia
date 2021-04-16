import Foundation
import UIKit

extension SettingViewController {
    
    @objc func closePicker() {

        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
        
        methodTextField.text = salaMethods[Row]
        if Row == 0 {
            vc.defaults.setValue(4, forKey: "method")
        }else if Row == 1 {
            vc.defaults.setValue(1, forKey: "method")
        }else if Row == 2 {
            vc.defaults.setValue(5, forKey: "method")
        }else if Row == 3 {
            vc.defaults.setValue(2, forKey: "method")
        }else if Row == 4 {
            vc.defaults.setValue(3, forKey: "method")
        }else if Row == 5 {
            vc.defaults.setValue(13, forKey: "method")
        }else if Row == 6 {
            vc.defaults.setValue(12, forKey: "method")
        }else if Row == 7 {
            vc.defaults.setValue(14, forKey: "method")
        }else {
            vc.defaults.setValue(4, forKey: "method")
        }
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
        
        methodTextField.text = salaMethods[Row]
        if Row == 0 {
            vc.defaults.setValue(4, forKey: "method")
        }else if Row == 1 {
            vc.defaults.setValue(1, forKey: "method")
        }else if Row == 2 {
            vc.defaults.setValue(5, forKey: "method")
        }else if Row == 3 {
            vc.defaults.setValue(2, forKey: "method")
        }else if Row == 4 {
            vc.defaults.setValue(3, forKey: "method")
        }else if Row == 5 {
            vc.defaults.setValue(13, forKey: "method")
        }else if Row == 6 {
            vc.defaults.setValue(12, forKey: "method")
        }else if Row == 7 {
            vc.defaults.setValue(14, forKey: "method")
        }else {
            vc.defaults.setValue(4, forKey: "method")
        }
        view.endEditing(true)
    }
    
    
}
