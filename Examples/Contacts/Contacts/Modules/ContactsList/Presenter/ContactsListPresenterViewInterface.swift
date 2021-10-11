//
//  ContactsListPresenterViewInterface.swift
//  ContactsList
//
//  Created by Seyed Samad on 9/27/21.
//

import Foundation
import UIKit

protocol ContactsListPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
    func numberOfRows(for section: Int) -> Int
    func textForCell(at indexPath: IndexPath) -> String
    func cellDidSelect(at indexPath: IndexPath)
}
