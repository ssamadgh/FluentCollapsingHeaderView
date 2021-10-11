//
//  ContactsListEntity.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation


public struct Contact {
    var firstName: String?
    var lastName: String?
    var company: String?
    var phones: [Phone] = []
    var emails: [Email] = []
    
    init() {
        
    }
}


extension Contact {
    public struct Phone {
        let type: String
        let number: String
    }

    public struct Email {
        let type: String
        let mail: String
    }
    
    var fullName: String {
        (firstName ?? "") + " " + (lastName ?? "")
    }
}
