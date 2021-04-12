import UIKit

class MainViewController: UIViewController{

    
    //API Data
    var country = ""
    var city = ""
    var defaults = UserDefaults.standard
    
    let urlBaseString = "http://api.aladhan.com/v1/timingsByCity?"
    
//Main info View
    @IBOutlet weak var todayCalenderLabel: UILabel!
    @IBOutlet weak var nextPrayerTimeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
//Main PrayerTime View
    @IBOutlet weak var todayFajrLabel: UILabel!
    @IBOutlet weak var todayZohrLabel: UILabel!
    @IBOutlet weak var todayAsrLabel: UILabel!
    @IBOutlet weak var todayMaghrbLabel: UILabel!
    @IBOutlet weak var todayIshaLabel: UILabel!
    
//Side PrayerTime View
    @IBOutlet weak var todayImsakLabel: UILabel!
    @IBOutlet weak var todayShroukLabel: UILabel!
    @IBOutlet weak var todayMidnightLabel: UILabel!
    
//Azkar View
    @IBAction func azkarSaba7Btn(_ sender: UIButton) {
        show(story: "AzkarSapa7", VC: AzkarSapa7ViewController.self)
    }
    
    @IBAction func azkarMasa2Btn(_ sender: UIButton) {
        show(story: "AzkarMasa2", VC: AzkarMasa2ViewController.self)
    }
    
//Go to Quran View
    @IBAction func goToQuranBtn(_ sender: UIButton) {
        showFull(story: "Quran", VC: PageViewController.self)
    }
    
//Go to Qibla View
    @IBAction func goToQiblaBtn(_ sender: UIButton) {

        showFull(story: "Qebla", VC: QeblaViewController.self)
    }
    
//A7adeth CollectionView
    
    
}

