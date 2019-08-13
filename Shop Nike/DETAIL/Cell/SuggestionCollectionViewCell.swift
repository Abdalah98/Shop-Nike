//
//  SuggestionCollectionViewCell.swift
//  Shop Nike
//
//  Created by Abdalah on 12/4/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage!{
        didSet{
            self.imageView.image = image
            self.setNeedsLayout()
            
        }
    }
}
