//
//  CustomTableViewCell.swift
//  JSONandSlider
//
//  Created by Pranoti Kulkarni on 2/20/18.
//  Copyright © 2018 Pranoti Kulkarni. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
