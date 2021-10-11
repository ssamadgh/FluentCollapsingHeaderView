//
//  ContactsListRouter.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

final class ContactsListRouter: RouterInterface {

    weak var presenter: ContactsListPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension ContactsListRouter: ContactsListRouterInterface {

    func showContactDetails(for contact: Contact) {
        let vc = ContactDetailsModule().build(contact: contact)
        viewController?.show(vc, sender: nil)
    }
    
}
