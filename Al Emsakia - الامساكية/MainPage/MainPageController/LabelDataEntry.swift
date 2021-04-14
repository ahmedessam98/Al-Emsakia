import Foundation
import UIKit

extension MainViewController {
    
    func didRetrieveAzanInfo(result: Azan) {
    
        let todayPrayerData = result.data
        DispatchQueue.main.async {
            
            self.todayCalenderLabel.text = todayPrayerData.date.gregorian.date
            
            self.cityLabel.text = self.city
            
            self.todayFajrLabel.text = todayPrayerData.timings.Fajr
            self.FajrT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Fajr)")
            
            self.todayZohrLabel.text = todayPrayerData.timings.Dhuhr
            self.ZohrT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Dhuhr)")
            
            self.todayAsrLabel.text = todayPrayerData.timings.Asr
            self.AsrT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Asr)")
            
            self.todayMaghrbLabel.text = todayPrayerData.timings.Maghrib
            self.MaghrbT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Maghrib)")
            
            self.todayIshaLabel.text = todayPrayerData.timings.Isha
            self.IshaT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Isha)")
            
            
            self.todayImsakLabel.text = todayPrayerData.timings.Imsak
            
            self.todayShroukLabel.text = todayPrayerData.timings.Sunrise
            self.ShroukT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Sunrise)")
            
            self.todayMidnightLabel.text = todayPrayerData.timings.Midnight
            self.MidNightT = self.formatterT.date(from: "\(todayPrayerData.date.gregorian.date) , \(todayPrayerData.timings.Midnight)")
    }
}
    
    func CCData (city:String, country:String) {
        
        defaults.setValue(city, forKey: "city")
        defaults.setValue(country, forKey: "country")
        
    }
    
    
}
