import Foundation
import UIKit
import CoreLocation

extension SelectCCViewController {
    
    //For hide pickerView after finish selecting
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        CountryPickerTextField.text = country
        CityPickerTextField.text = city
        view.endEditing(true)
    }
    
    //Function of Done of ToolBar of PickerView
    @objc func closePicker() {
        CountryPickerTextField.text = countriesData[CountryCurrentIndex]
        CityPickerTextField.text = cityData[CountryCurrentIndex][CityCurrentIndex]
        country = CountryPickerTextField.text ?? ""
        city = CityPickerTextField.text ?? ""
        print(country)
        print(city)
        view.endEditing(true)
    }
    //Location Button Functions
    func saveCCPressed() {
        
        mainVC?.CCData(city: city, country: country)

        dismiss(animated: true) {
           
            self.mainVC?.CCData(city: self.city, country: self.country)
            
           }
        }
    }
    

