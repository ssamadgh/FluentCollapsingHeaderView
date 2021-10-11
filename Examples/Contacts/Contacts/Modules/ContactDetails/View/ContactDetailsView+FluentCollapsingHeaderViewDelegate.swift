//
//  ContactDetailsView+FluentCollapsingHeaderViewDelegate.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 10/1/21.
//

import UIKit
import FluentCollapsingHeaderView

extension ContactDetailsView: FluentCollapsingHeaderViewDelegate {
    
    func headerDidAnimate(to currentValueWithMinMax: (CGFloat, CGFloat) -> CGFloat) {
        let avatarHeight = currentValueWithMinMax(40, 80)
        avatarHeightConstraint.constant = avatarHeight
        let scale = currentValueWithMinMax(0,1)
        companyLabel.transform = .init(scaleX: scale, y: scale)
        companyLabel.alpha = scale
    }

}
