//
//  MainView.swift
//  Main
//
//  Created by Seyed Samad on 9/13/21.
//

import Foundation
import UIKit
import FluentCollapsingHeaderView

final class MainView: UIViewController, ViewInterface {
	
	var presenter: MainPresenterViewInterface!
	
	// MARK: - Properties
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var degreeSymbolLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: FluentCollapsingHeaderView!
    @IBOutlet weak var locationLabelTopConstraint: NSLayoutConstraint!
    
	
	// MARK: - Initialize

	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = nil
        tableView.allowsSelection = false
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        tableView.register(UINib(nibName: "KeyValueCell", bundle: nil), forCellReuseIdentifier: "KeyValueCell")

        
        
        headerView?.delegate = self
        headerView.minHeight = floor((UIScreen.main.bounds.height)*0.136)
        headerView.maxHeight = floor((UIScreen.main.bounds.height)*0.45)

        locationLabel.text = ""
        conditionLabel.text = ""
        temperatureLabel.text = "--"
        lowTemp.text = ""
        highTemp.text = ""
        conditionImageView.image = nil
        

		self.presenter.viewDidLoad()
	}
    
    
}

extension MainView: MainViewInterface {
    
    func reload() {
        locationLabel.text = presenter.locationName
        conditionLabel.text = presenter.currentCondition
        temperatureLabel.text = presenter.currentTemp
        lowTemp.text = presenter.lowTemp
        highTemp.text = presenter.hightTemp
        presenter.updateConditionImage(for: conditionImageView)
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = self.presenter.isDay ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0.1537809786, blue: 0.4170270647, alpha: 1)
            self.headerView.backgroundColor = self.presenter.isDay ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0.1537809786, blue: 0.4170270647, alpha: 1)
        }
        
        tableView.reloadData()
    }
    
}
