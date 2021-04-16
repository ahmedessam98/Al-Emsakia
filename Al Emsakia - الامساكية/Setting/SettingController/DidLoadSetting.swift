import Foundation
import UIKit

extension SettingViewController {
    
    override func viewDidLoad() {
        
        pickerMethod.delegate = self
        pickerMethod.dataSource = self
        methodTextField.inputView = pickerMethod
        //Adding ToolBar on top of PickerView
        toolBar.sizeToFit()
        toolBar.setItems([DoneBtn], animated: true)
        methodTextField.inputAccessoryView = toolBar
    }
}
