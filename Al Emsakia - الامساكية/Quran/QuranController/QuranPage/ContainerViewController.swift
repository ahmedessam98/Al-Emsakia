import UIKit

class ContainerViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "QuranViewController") as? QuranViewController else {return}
        
        if vc.defaults.integer(forKey: "pageIndex") == vc.defaults.integer(forKey: "savedPage") {
            theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
        }else {
            theMark.setBackgroundImage(nil, for: .normal)
        }
    }
   
    @IBOutlet weak var theMark: UIButton!
    
    
    @IBAction func backToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveMarkPressed(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "QuranViewController") as? QuranViewController {
        vc.savedPage = vc.defaults.integer(forKey: "pageIndex")
        vc.defaults.setValue(vc.savedPage, forKey: "savedPage")
        print(vc.savedPage)
        theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
        }
    }
    
    @IBAction func goToMark(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "QuranViewController") as? QuranViewController else {return}
        
        vc.pageIndex = vc.defaults.integer(forKey: "savedPage")
        print(vc.pageIndex)
    //    vc.quranPageImage.image = vc.quranPages[vc.pageIndex]
        
    }
    
    @IBAction func indexMenu(_ sender: UIButton) {
        
    }
    
    @IBAction func do3a2Quran(_ sender: UIButton) {
    }
    
}
