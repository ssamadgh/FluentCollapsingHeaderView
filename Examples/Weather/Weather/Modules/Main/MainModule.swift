//
//  MainModule.swift
//  Main
//
//  Created by Seyed Samad on 9/13/21.
//
import Foundation
import UIKit

final class MainModule: ModuleInterface {

    typealias View = MainView
    typealias Presenter = MainPresenter
    typealias Router = MainRouter
    typealias Interactor = MainInteractor

    func build() -> UIViewController {
        let view = UIStoryboard(name: "MainView", bundle: nil).instantiateInitialViewController() as! View
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
