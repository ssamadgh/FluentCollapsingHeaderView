//
//  ContactDetailsModule.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import UIKit


// MARK: - module builder

final class ContactDetailsModule: ModuleInterface {

    typealias View = ContactDetailsView
    typealias Presenter = ContactDetailsPresenter
    typealias Router = ContactDetailsRouter
    typealias Interactor = ContactDetailsInteractor

    func build(contact: Contact) -> UIViewController {
        let view = UIStoryboard(name: "ContactDetailsView", bundle: nil).instantiateInitialViewController() as! View
        let interactor = Interactor()
        let presenter = Presenter(contact: contact)
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
