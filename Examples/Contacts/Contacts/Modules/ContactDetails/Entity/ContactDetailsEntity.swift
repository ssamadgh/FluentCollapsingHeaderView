//
//  ContactDetailsEntity.swift
//  ContactDetails
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation


enum ViewSectionModel {
    case number([Contact.Phone]), mail([Contact.Email])
}


extension Contact {
    
    var viewModel: [ViewSectionModel] {
        var model: [ViewSectionModel] = []
        if !phones.isEmpty {
            model.append(.number(phones))
        }
        
        if !emails.isEmpty {
            model.append(.mail(emails))
        }
        
        return model
    }
    
}
