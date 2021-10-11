//
//  ContactDetailsPresenter.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

final class ContactDetailsPresenter: PresenterInterface {

    var router: ContactDetailsRouterInterface!
    var interactor: ContactDetailsInteractorInterface!
    weak var view: ContactDetailsViewInterface!

    let contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
}

extension ContactDetailsPresenter: ContactDetailsPresenterRouterInterface {

}

extension ContactDetailsPresenter: ContactDetailsPresenterInteractorInterface {

}

extension ContactDetailsPresenter: ContactDetailsPresenterViewInterface {

    func viewDidLoad() {

    }

    var fullName: String {
        contact.fullName
    }
    
    var company: String? {
        contact.company
    }
    
    var avatar: UIImage {
        AvatarGenerator.generate(withFirstName: contact.firstName ?? "", lastName: contact.lastName ?? "")
    }
    
}
