//
//  MainView+SimpleCollapsingHeaderViewDelegate.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/14/21.
//

import UIKit
import FluentCollapsingHeaderView

extension MainView: FluentCollapsingHeaderViewDelegate {
    
    func headerDidAnimate(to currentValueWithMinMax: (CGFloat, CGFloat) -> CGFloat) {
        let max: CGFloat = 40
        locationLabelTopConstraint.constant = min(max, currentValueWithMinMax(0, max))
        temperatureLabel.alpha = currentValueWithMinMax(-0.5, 1)
        degreeSymbolLabel.alpha = currentValueWithMinMax(-0.5, 1)
        lowTemp.alpha = currentValueWithMinMax(-2, 1)
        highTemp.alpha = currentValueWithMinMax(-2, 1)
        conditionImageView.alpha = currentValueWithMinMax(-2, 1)
    }

}
