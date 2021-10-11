//
//  ContactsListView+DataSource.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 10/11/21.
//

import UIKit

extension ContactsListView {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(for: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter.textForCell(at: indexPath)
        
        return cell
    }
}


