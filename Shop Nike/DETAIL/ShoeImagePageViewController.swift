//
//  ShoeImagePageViewController.swift
//  Shop Nike
//
//  Created by Abdalah on 12/5/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit
protocol ShoeImagePageViewControllerDelegate:class {
    func setupPageController(numberOfPages:Int)
    func turnPageController(to index : Int)
}
class ShoeImagePageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    var images:[UIImage]? = Shoe.fetchShoes().first?.images
    
    var pageViewControllerDelegate:ShoeImagePageViewControllerDelegate?
    struct Storyboard{
        static let shoeImageViewController = "ShoeImageViewController"
    }
    
    // lazy
   lazy var controllers:[UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        if let images = self.images{
            for image in images{
                 let shoeImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.shoeImageViewController)
                controllers.append(shoeImageVC)
            }
        }
    self.pageViewControllerDelegate?.setupPageController(numberOfPages : controllers.count)
        return controllers
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        self.turnToPage(index : 0)
    }
    func turnToPage(index : Int){
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        if let currentVC = viewControllers?.first{
            let currentIndex = controllers.index(of:currentVC)!
            if  currentIndex > index {
                direction = .reverse
            }
        }
        self.configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController : UIViewController){
        for (index , vc)in controllers .enumerated(){
            if viewController == vc {
                if let shoeImageVc = viewController as? ShoeImageViewController {
                    shoeImageVc.image = self.images?[index]
                    self.pageViewControllerDelegate?.turnPageController(to: index)

                }
            }
        }
    }
    
    
    //page data
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index > 0{
                return controllers[index - 1]
            }
        }
        return controllers.last

    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 {
                return controllers[index + 1 ]
            }
        }
        return controllers.first

    }
    //delegt
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! ShoeImageViewController )
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers as! ShoeImageViewController)
        }
    }
}
