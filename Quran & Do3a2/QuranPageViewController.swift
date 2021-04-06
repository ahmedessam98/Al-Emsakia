import UIKit

class QuranPageViewController: UIViewController {
    
    
//    @IBOutlet weak var theMark: UIButton!
//
//    @IBAction func MarkPressed(_ sender: UIButton) {
//        let pageController = self.storyboard?.instantiateViewController(identifier: "QuranPagesVC") as? QuranPagesVC
//        pageController?.savedPage = pageController!.pageIndex
//        pageController?.defaults.setValue(pageController?.savedPage, forKey: "savedPage")
//        theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
//    }
//
//    @IBAction func goMarkPressed(_ sender: UIButton) {
//        let pageController  = self.storyboard?.instantiateViewController(identifier: "QuranPagesVC") as? QuranPagesVC
//        pageController?.pageIndex = pageController!.savedPage
//        theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
//
//            }
//
//
//    @IBOutlet weak var pageControllerHolderView: UIView!
//    lazy var QuranPagesVC: UIPageViewController = {
//        return UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
//    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()

    }
    
    func setupPageViewController() {
//        //set its datasource and delegate methods
//        self.QuranPagesVC.dataSource = self
//        self.QuranPagesVC.delegate = self
//        self.QuranPagesVC.view.frame = .zero
//        
//        //Show view controller with initial page - page zero
//        let pageController = getPageFor(index: 0)
//        guard let initialPageController = pageController else { return }
//        self.QuranPagesVC.setViewControllers([initialPageController], direction: .forward, animated: false, completion: nil)
//        self.addChild(self.QuranPagesVC)
//        
//        //Add to holder view
//        self.pageControllerHolderView.addSubview(self.QuranPagesVC.view)
//        self.QuranPagesVC.didMove(toParent: self)
//       
//        //Pin to super view - (holder view)
//        self.QuranPagesVC.view.translatesAutoresizingMaskIntoConstraints = false
//        self.QuranPagesVC.view.topAnchor.constraint(equalTo: self.pageControllerHolderView.topAnchor).isActive = true
//        self.QuranPagesVC.view.leftAnchor.constraint(equalTo: self.pageControllerHolderView.leftAnchor).isActive = true
//        self.QuranPagesVC.view.bottomAnchor.constraint(equalTo: self.pageControllerHolderView.bottomAnchor).isActive = true
//        self.QuranPagesVC.view.rightAnchor.constraint(equalTo: self.pageControllerHolderView.rightAnchor).isActive = true
    }
    
    //Helper method to create view controllers for page view controller
    //for specified index
    func getPageFor(index: Int) -> QuranPagesVC? {
        guard  let pageController  = self.storyboard?.instantiateViewController(identifier: "QuranPagesVC") as? QuranPagesVC else { return nil }
        pageController.pageIndex = index
        return pageController
    }
}

extension QuranPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore
        viewController: UIViewController) -> UIViewController? {
        guard let beforePage = viewController as? QuranPagesVC else { return nil }
        let beforePageIndex = beforePage.pageIndex
        if beforePage.pageIndex == beforePage.savedPage {
            beforePage.theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
        }else {
            beforePage.theMark.setBackgroundImage(nil, for: .normal)
        }

        //since it is before we need to go back the index
        let newIndex = beforePageIndex - 1
        if newIndex < 0 { return nil }
        if newIndex > 602 { return nil }
        beforePage.pageIndex = newIndex
        beforePage.defaults.setValue(newIndex, forKey: "pageIndex")
        return getPageFor(index: newIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let afterPage = viewController as? QuranPagesVC else { return nil }
        let afterPageIndex = afterPage.pageIndex
        if afterPage.pageIndex == afterPage.savedPage {
            afterPage.theMark.setBackgroundImage(UIImage(named: "علامة المصحف")!, for: .normal)
        }else {
            afterPage.theMark.setBackgroundImage(nil, for: .normal)
        }
        //since it is after we need to go forword
        let newIndex = afterPageIndex + 1
        if newIndex < 0 { return nil }
        if newIndex > 602 { return nil }
        afterPage.pageIndex = newIndex
        afterPage.defaults.setValue(newIndex, forKey: "pageIndex")
        return getPageFor(index: newIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
}


