//
//  FeedShoeTableViewCell.swift
//  Shop Nike
//
//  Created by Abdalah on 12/4/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit

class FeedShoeTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var shoe: Shoe! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        shoeImageView.image = shoe.images?.first
        shoeNameLabel.text = shoe.name
        if let price = shoe.price {
            shoePriceLabel.text = "$\(price)"
        } else {
            shoePriceLabel.text = ""
        }
    }
}
