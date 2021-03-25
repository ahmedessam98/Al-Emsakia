import UIKit
import CoreLocation

class SelectCCViewController: UIViewController,UITextFieldDelegate {
    
    //Ressulted Country & City
    var country:String = ""
    var city:String = ""
    var countryShortName: String = ""
    
    //Main VC
    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController

    //Picker Identification
    let PickerCity = UIPickerView()
    let PickerCountry = UIPickerView()
    
    //Data Identification
    var countriesData: [String] = [String]()
    var cityData: [[String]] = [[String]]()
    
    //ToolBar Identification
    let toolBar = UIToolbar()
    let DoneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))
    //Data of closePicker function
    var CountryCurrentIndex = 0
    var CityCurrentIndex = 0
    
    //AutoLocation Identification
    let locationManager = CLLocationManager()
    var location:CLLocation?
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    let authStatus = CLLocationManager.authorizationStatus()
    
    // Auto Location Buttons
    @IBOutlet weak var AutoCCLabel: UILabel!
    @IBAction func AutoLocationBtn(_ sender: UIButton) {
        startLocationManager()
        parsePlacemarks()
        if city != "" || country != "" {
           AutoCCLabel.textAlignment = .center
           AutoCCLabel.text = "\(city),\(country)"
        }
        }
        

    @IBAction func AutoLocationPressed(_ sender: UIButton) {
        saveCCPressed()
    }
    
    
    // Manual Location Buttons
    @IBOutlet weak var CountryPickerTextField: UITextField!
    @IBOutlet weak var CityPickerTextField: UITextField!
    @IBAction func ManualLocationPressed(_ sender: UIButton) {
        saveCCPressed()
    }
    
    

}
