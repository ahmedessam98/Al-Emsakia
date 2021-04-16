import Foundation
import UIKit

extension SettingViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salaMethods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salaMethods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
        
        methodTextField.text = salaMethods[row]
        Row = row
        if row == 0 {
            vc.defaults.setValue(4, forKey: "method")
        }else if row == 1 {
            vc.defaults.setValue(1, forKey: "method")
        }else if row == 2 {
            vc.defaults.setValue(5, forKey: "method")
        }else if row == 3 {
            vc.defaults.setValue(2, forKey: "method")
        }else if row == 4 {
            vc.defaults.setValue(3, forKey: "method")
        }else if row == 5 {
            vc.defaults.setValue(13, forKey: "method")
        }else if row == 6 {
            vc.defaults.setValue(12, forKey: "method")
        }else if row == 7 {
            vc.defaults.setValue(14, forKey: "method")
        }else {
            vc.defaults.setValue(4, forKey: "method")
        }
    }
}
