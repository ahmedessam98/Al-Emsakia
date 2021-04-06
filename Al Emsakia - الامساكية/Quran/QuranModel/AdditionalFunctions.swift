import Foundation
import UIKit

extension PageViewController {
    
    //Helper method to create view controllers for page view controller
    //for specified index
    func getPageFor(index: Int) -> QuranViewController? {
        guard  let pageController  = self.storyboard?.instantiateViewController(identifier: "QuranViewController") as? QuranViewController else { return nil }
        pageController.pageIndex = index
        return pageController
    }
    
    func setupPageViewController() {

                //set its datasource and delegate methods
                dataSource = self
                delegate = self
        
                //Show view controller with initial page - page zero
                let pageController = getPageFor(index: 0)
                guard let initialPageController = pageController else { return }
                setViewControllers([initialPageController], direction: .forward, animated: false, completion: nil)

    }
}
