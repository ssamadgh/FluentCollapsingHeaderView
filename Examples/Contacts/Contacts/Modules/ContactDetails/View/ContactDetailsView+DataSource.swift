//
//  ContactDetailsView+DataSource.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 9/27/21.
//

import UIKit

extension ContactDetailsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactDetailPhoneCell(reuseIdentifier: "Contact")

        cell.textLabel?.text = presenter.key(for: indexPath)
        cell.detailTextLabel?.text = presenter.value(for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }

}

