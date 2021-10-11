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
}
