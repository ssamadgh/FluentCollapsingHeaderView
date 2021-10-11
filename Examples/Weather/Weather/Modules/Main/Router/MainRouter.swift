//
//  MainRouter.swift
//  Main
//
//  Created by Seyed Samad on 9/13/21.
//

import Foundation
import UIKit

final class MainRouter: RouterInterface {

    weak var presenter: MainPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension MainRouter: MainRouterInterface {

}
