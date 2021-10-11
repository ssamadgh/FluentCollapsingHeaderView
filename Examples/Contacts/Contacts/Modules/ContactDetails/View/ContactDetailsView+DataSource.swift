//
//  ContactDetailsView+DataSource.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 9/27/21.
//

import UIKit

extension ContactDetailsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactDetailPhoneCell(reuseIdentifier: "Contact")
        cell.textLabel?.text = "iPhone"
        cell.detailTextLabel?.text = "00 1 2334 445"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }

}

