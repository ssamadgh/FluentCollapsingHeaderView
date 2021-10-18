//
//  ContactDetailsView.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit
import FluentCollapsingHeaderView

final class ContactDetailsView: UIViewController, ViewInterface {
	
	var presenter: ContactDetailsPresenterViewInterface!
	
	// MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: FluentCollapsingHeaderView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var topHeaderConstraint: NSLayoutConstraint!
    
    
    
	// MARK: - Initialize

	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage.imageFromColor(.clear)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(.clear), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true

        tableView.delegate = self
        tableView.dataSource = self        
        
        headerView?.delegate = self
        headerView.minHeight = 150

        avatarImageView.image = presenter.avatar
        fullNameLabel.text = presenter.fullName
        companyLabel.text = presenter.company
        
		self.applyTheme()
		self.presenter.viewDidLoad()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.topHeaderConstraint.constant -= self.navigationController?.navigationBar.frame.height ?? 0
            self.view.setNeedsUpdateConstraints()
        }
    }
		
	// MARK: - Theme
	
	func applyTheme() {
        headerView.backgroundColor = UIColor.systemGroupedBackground
        view.backgroundColor = UIColor.systemGroupedBackground
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        fullNameLabel.textColor = UIColor.label
        
        companyLabel.font = UIFont.systemFont(ofSize: 13)
        companyLabel.textColor = .secondaryLabel
	}
	
	
	// MARK: - Actions
	
	
}

extension ContactDetailsView: ContactDetailsViewInterface {
	
    func reload() {
        tableView.reloadData()
    }
}
