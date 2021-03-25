import UIKit

class Do3a2QuranVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do3a2ImageView.image = UIImage(named: "do3a2Quran")!
        
    }
    @IBOutlet weak var do3a2ImageView: UIImageView!
    @IBAction func backToQuran(_ sender: UIButton) {
        performSegue(withIdentifier: "backToQuran", sender: self)
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        performSegue(withIdentifier: "backToMain", sender: self)
    }
    
}
