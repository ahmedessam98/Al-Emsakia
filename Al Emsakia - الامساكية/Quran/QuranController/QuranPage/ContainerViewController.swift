import UIKit

protocol ContainerViewDelegate {
    func goToMarkPressed()
}

class ContainerViewController: UIViewController {
    
    var delegate:ContainerViewDelegate?
    
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
        delegate?.goToMarkPressed()
        theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
    }
    
    @IBAction func indexMenu(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "fehresTableViewController") {
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        

        
    }
    
    @IBAction func do3a2Quran(_ sender: UIButton) {
        
        if let do3a2 = storyboard?.instantiateViewController(identifier: "Do3a2Quran") {
            
            do3a2.modalPresentationStyle = .fullScreen
            present(do3a2, animated: true, completion: nil)
        }
    }
    
}
