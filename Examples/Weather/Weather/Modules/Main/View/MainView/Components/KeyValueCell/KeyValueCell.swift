//
//  KeyValueCellTableViewCell.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/16/21.
//

import UIKit

class KeyValueCell: UITableViewCell {
    
    public var keyValue1: KeyValueModel? {
        didSet {
            keyLabel1.text = keyValue1?.key
            valueLabel1.text = keyValue1?.value
        }
    }
    
    public var keyValue2: KeyValueModel? {
        didSet {
            keyLabel2.text = keyValue2?.key
            valueLabel2.text = keyValue2?.value
        }
    }
    
    @IBOutlet weak private var keyLabel1: UILabel!
    @IBOutlet weak private var valueLabel1: UILabel!
    
    @IBOutlet weak private var keyLabel2: UILabel!
    @IBOutlet weak private var valueLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        keyLabel1.textColor = .white
        keyLabel2.textColor = .white
        valueLabel1.textColor = .white
        valueLabel2.textColor = .white
        
    }
    
    
    
}
