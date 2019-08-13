//
//  ShoeImageHeaderViewController.swift
//  Shop Nike
//
//  Created by Abdalah on 12/5/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit

class ShoeImageHeaderView: UIView {

    @IBOutlet weak var pageControl :UIPageControl!
    


}
extension ShoeImageHeaderView :ShoeImagePageViewControllerDelegate{
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
    
}
