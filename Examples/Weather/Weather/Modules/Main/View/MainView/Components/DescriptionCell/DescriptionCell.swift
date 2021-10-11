//
//  DescriptionCell.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/16/21.
//

import UIKit

class DescriptionCell: UITableViewCell {

    var descriptionText: String? {
        didSet {
            label.text = descriptionText
        }
    }
    
    @IBOutlet weak private var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.textColor = .white
    }
    
}
