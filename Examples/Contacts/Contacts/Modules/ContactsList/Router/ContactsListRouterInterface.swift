//
//  ContactsListRouterInterface.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import UIKit

protocol ContactsListRouterInterface: RouterPresenterInterface {

    func showContactDetails(for contact: Contact)
}

