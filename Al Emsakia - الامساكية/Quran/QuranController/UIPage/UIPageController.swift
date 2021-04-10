import Foundation
import UIKit

extension PageViewController :UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let afterPage = viewController as? QuranViewController else { return nil }
        let afterPageIndex = afterPage.pageIndex
        
        //since it is after we need to go forword
        let newIndex = afterPageIndex + 1
        if newIndex < 0 { return nil }
        if newIndex > 602 { return nil }
        afterPage.pageIndex = newIndex
        afterPage.defaults.setValue(newIndex, forKey: "pageIndex")
        return getPageFor(index: newIndex)
    }
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let beforePage = viewController as? QuranViewController else { return nil }
        let beforePageIndex = beforePage.pageIndex
        
        //since it is before we need to go back the index
        let newIndex = beforePageIndex - 1
        if newIndex < 0 { return nil }
        if newIndex > 602 { return nil }
        beforePage.pageIndex = newIndex
        beforePage.defaults.setValue(newIndex, forKey: "pageIndex")
        return getPageFor(index: newIndex)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
    
}
