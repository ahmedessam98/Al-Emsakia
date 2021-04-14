import Foundation
import UIKit

extension MainViewController {
    
    @objc func getTimeOfDate() {

        guard let fajrE = FajrT?.timeIntervalSinceNow else { return }
        guard let shroukE = ShroukT?.timeIntervalSinceNow else { return }
        guard let zohrE = ZohrT?.timeIntervalSinceNow else { return }
        guard let asrE = AsrT?.timeIntervalSinceNow else { return }
        guard let maghrbE = MaghrbT?.timeIntervalSinceNow else { return }
        guard let ishaE = IshaT?.timeIntervalSinceNow else { return }
        guard let midnightE = MidNightT?.timeIntervalSinceNow else { return }
        
        if fajrE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: fajrE) as String
            nextSalaLabel.text = "اذان الفجر بعد:"
        }else if shroukE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: shroukE) as String
            nextSalaLabel.text = "الشروق بعد:"
        }else if zohrE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: zohrE) as String
            nextSalaLabel.text = "اذان الظهر بعد:"
        }else if asrE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: asrE) as String
            nextSalaLabel.text = "اذان العصر بعد:"
        }else if maghrbE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: maghrbE) as String
            nextSalaLabel.text = "اذان المغرب بعد:"
        }else if ishaE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: ishaE) as String
            nextSalaLabel.text = "اذان العشاء بعد:"
        }else if midnightE >= 0 {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: midnightE) as String
            nextSalaLabel.text = "منتصف الليل:"
        }else {
            nextPrayerTimeLabel.text = stringFromTimeInterval(interval: midnightE) as String
            nextSalaLabel.text = "منتصف الليل:"
        }
    }
    
    
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {

      let ti = NSInteger(interval)

      let seconds = ti % 60
      let minutes = (ti / 60) % 60
      let hours = (ti / 3600)

      return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
}
