//
//  ContactsListPresenter.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation

final class ContactsListPresenter: PresenterInterface {

    var router: ContactsListRouterInterface!
    var interactor: ContactsListInteractorInterface!
    weak var view: ContactsListViewInterface!

    var contacts: [Contact] = []
    
    
    func contact(for indexPath: IndexPath) -> Contact {
        contacts[indexPath.row]
    }
    
}

extension ContactsListPresenter: ContactsListPresenterRouterInterface {

}

extension ContactsListPresenter: ContactsListPresenterInteractorInterface {

}

extension ContactsListPresenter: ContactsListPresenterViewInterface {

    func viewDidLoad() {
        var john = Contact()
        john.firstName = "John"
        john.lastName = "Appleseed"
        john.company = "Apple Co."
        john.phones = [
            Contact.Phone(type: "iPhone", number: "+123456789")
        ]
        
        var kate = Contact()
        kate.firstName = "Kate"
        kate.lastName = "Bell"
        kate.company = "Apple Co."
        kate.phones = [
            Contact.Phone(type: "iPhone", number: "+123456789"),
            Contact.Phone(type: "home1", number: "+1987654321"),
            Contact.Phone(type: "home2", number: "+1987654322"),
            Contact.Phone(type: "work1", number: "+1435464663"),
            Contact.Phone(type: "work2", number: "+1435464664")


        ]
        kate.emails = [
            Contact.Email(type: "work", mail: "kate@apple.com"),
            Contact.Email(type: "home", mail: "kate@icloud.com"),
            Contact.Email(type: "work", mail: "kate@yahoo.com"),
            Contact.Email(type: "work", mail: "kate@gmail.com"),
        ]
        let contacts: [Contact] = [
            john, kate
        ]
        
        self.contacts = contacts
        self.view.reload()
    }
    
    func numberOfRows(for section: Int) -> Int {
        contacts.count
    }
    
    func textForCell(at indexPath: IndexPath) -> String {
        contact(for: indexPath).fullName
    }

    func cellDidSelect(at indexPath: IndexPath) {
        router.showContactDetails(for: contact(for: indexPath))
    }
    
}
