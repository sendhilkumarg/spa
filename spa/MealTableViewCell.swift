//
//  MealTableViewCell.swift
//  spa
//
//  Created by Sendhil kumar Gurunathan on 11/1/15.
//  Copyright © 2015 Sendhil kumar Gurunathan. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBOutlet weak var ratingsControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
