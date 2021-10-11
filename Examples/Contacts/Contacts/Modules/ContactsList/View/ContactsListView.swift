//
//  ContactsListView.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

final class ContactsListView: UITableViewController, ViewInterface {
	
	var presenter: ContactsListPresenterViewInterface!
	
	// MARK: - Properties
	
	
	// MARK: - Initialize

	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Contacts"
		self.applyTheme()
		self.presenter.viewDidLoad()
	}
	
	
	// MARK: - Theme
	
	func applyTheme() {
		
	}
	
	
	// MARK: - Actions
	
	
}

extension ContactsListView: ContactsListViewInterface {
    
    func reload() {
        self.tableView.reloadData()
    }
    
	
}
