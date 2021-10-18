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
    
    var viewModel: [ViewSectionModel] { contact.viewModel }
    
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
    
    var numberOfSections: Int {
        viewModel.count
    }
    
    func numberOfRows(at section: Int) -> Int {
        switch viewModel[section] {
        case .mail(let mails):
            return mails.count
        case .number(let numbers):
            return numbers.count
        }
    }
    
    func model(at section: Int) -> ViewSectionModel {
        viewModel[section]
    }
    
    func key(for indexPath: IndexPath) -> String {
        switch model(at: indexPath.section) {
        case .number(let phones):
            return phones[indexPath.row].type
        case .mail(let mailes):
            return mailes[indexPath.row].type
        }
    }
    
    func value(for indexPath: IndexPath) -> String {
        switch model(at: indexPath.section) {
        case .number(let phones):
            return phones[indexPath.row].number
        case .mail(let mailes):
            return mailes[indexPath.row].mail
        }
    }

    
}
