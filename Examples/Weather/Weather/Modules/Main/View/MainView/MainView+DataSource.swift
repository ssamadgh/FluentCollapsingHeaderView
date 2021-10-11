//
//  MainView+DataSource.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import UIKit

extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.item(for: indexPath)
        
        let cell: UITableViewCell
        
        switch item {
        case let .description(description):
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            descriptionCell.descriptionText = description
            cell = descriptionCell
            
        case let .dualKeyValue(keyValue1, keyValue2):
            let keyValueCell = tableView.dequeueReusableCell(withIdentifier: "KeyValueCell", for: indexPath) as! KeyValueCell
            keyValueCell.keyValue1 = keyValue1
            keyValueCell.keyValue2 = keyValue2
            cell = keyValueCell
        }
        
        cell.backgroundColor = .clear
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
}
