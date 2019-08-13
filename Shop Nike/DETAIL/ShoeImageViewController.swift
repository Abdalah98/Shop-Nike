//
//  ShoeImageViewController.swift
//  Shop Nike
//
//  Created by Abdalah on 12/5/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit

class ShoeImageViewController: UIViewController {

 
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = image
    }

  

}
