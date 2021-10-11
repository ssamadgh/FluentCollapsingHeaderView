//
//  ContactDetailsRouter.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

final class ContactDetailsRouter: RouterInterface {

    weak var presenter: ContactDetailsPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension ContactDetailsRouter: ContactDetailsRouterInterface {

    
}
