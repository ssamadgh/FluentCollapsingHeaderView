//
//  ContactDetailPhoneCell.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 9/28/21.
//

import UIKit


class ContactDetailPhoneCell: UITableViewCell {
    
    
    init(reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        applyTheme()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func applyTheme() {
        textLabel?.font = UIFont.systemFont(ofSize: 11, weight: .light)
        textLabel?.textColor = .label
        
        
        detailTextLabel?.font = UIFont.systemFont(ofSize: 11, weight: .light)
        detailTextLabel?.textColor = .systemBlue
    }
    
}
