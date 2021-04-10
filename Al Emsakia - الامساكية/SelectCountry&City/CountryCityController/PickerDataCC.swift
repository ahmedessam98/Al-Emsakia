import Foundation
import UIKit

extension SelectCCViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == PickerCountry {
           
            return countriesData.count
        }else if pickerView == PickerCity {
           
            let countryRow = PickerCountry.selectedRow(inComponent: 0)
            return cityData[countryRow].count
        }else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == PickerCountry {

            return countriesData[row]

        }else if pickerView == PickerCity {

            let countryRow = PickerCountry.selectedRow(inComponent: 0)
            return cityData[countryRow][row]

        }else {
            return nil
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == PickerCountry {
            country = countriesData[PickerCountry.selectedRow(inComponent: 0)]
            CountryCurrentIndex = row
//            PickerCity.reloadComponent(0)
            print(country)
            
        }else if pickerView == PickerCity {
            city = cityData[PickerCountry.selectedRow(inComponent: 0)][PickerCity.selectedRow(inComponent: 0)]
            CityCurrentIndex = row
            print(city)
        }
    }
    
    
}
