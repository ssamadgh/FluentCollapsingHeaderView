//
//  ContactDetailsPresenterViewInterface.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

protocol ContactDetailsPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
    var fullName: String { get }
    var company: String? { get }
    var avatar: UIImage { get }
    
    var numberOfSections: Int { get }
    func numberOfRows(at section: Int) -> Int
    func key(for indexPath: IndexPath) -> String
    func value(for indexPath: IndexPath) -> String

    
}
