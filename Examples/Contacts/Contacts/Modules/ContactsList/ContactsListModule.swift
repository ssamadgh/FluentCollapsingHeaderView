//
//  ContactsListModule.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import UIKit


// MARK: - module builder

final class ContactsListModule: ModuleInterface {

    typealias View = ContactsListView
    typealias Presenter = ContactsListPresenter
    typealias Router = ContactsListRouter
    typealias Interactor = ContactsListInteractor

    func build() -> UIViewController {
        let view = UIStoryboard(name: "ContactsListView", bundle: nil).instantiateInitialViewController() as! View
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
