//
//  ShoeDetailCell.swift
//  Shop Nike
//
//  Created by Abdalah on 12/4/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit

class ShoeDetailCell: UITableViewCell {
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoeDescriptionLabel: UILabel!
    var shoe:Shoe!{
        didSet{
            self.updateUI()
        }
    }
    func updateUI()
{
    shoeNameLabel.text = shoe.name
    shoeDescriptionLabel.text = shoe.description
    }

}
