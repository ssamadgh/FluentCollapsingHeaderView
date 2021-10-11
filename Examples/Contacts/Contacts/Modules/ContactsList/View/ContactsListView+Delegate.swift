//
//  ContactsListView+Delegate.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 10/11/21.
//

import UIKit


extension ContactsListView {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellDidSelect(at: indexPath)
    }
}
