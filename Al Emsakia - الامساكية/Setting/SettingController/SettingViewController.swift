import UIKit

class SettingViewController: UIViewController , UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
//Picker Variable & View
    let salaMethods = ["جامعة ام القري ،مكة","جامعة العلوم الاسلامية","هيئة المساحة المصرية","الجامعة الاسلامية بشمال امريكا","رابطة العالم الاسلامي","رئاسة الشئون الدينية ،تركيا","فرنسا","روسيا"]
    let pickerMethod = UIPickerView()
    var Row = 0
    
//ToolBar Identification
    let toolBar = UIToolbar()
    let DoneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))

//View Buttons
    @IBAction func backToMain(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var methodTextField: UITextField!
    
    @IBOutlet weak var azanSegment: UISwitch!
    @IBAction func azanSegment(_ sender: UISwitch) {
        
        print(sender.isOn)
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController {
            vc.defaults.set(sender.isOn, forKey: "azanStatus")
        }
    }
    
    @IBAction func resetCountryCity(_ sender: UIButton) {
        
        show(story: "SelectCC", VC: SelectCCViewController.self)
    }
    
    @IBAction func aboutApp(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "aboutApp") {
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func contactInfo(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "contactInfo") {
            present(vc, animated: true, completion: nil)
        }
    }
    
}
