//
//  RGBRouter.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

class RGBRouter: RGBRouterProtocol {
    
    // Keep a single instance of RGBViewController to prevent deallocation
    static var rgbViewControllerInstance: RGBViewController?

    static func createModule() -> UIViewController {
        // Return the stored instance if it already exists
        if let viewController = rgbViewControllerInstance {
            return viewController
        }

        // Create a new instance of RGBViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RGBViewController") as! RGBViewController

        // Instantiate the presenter and interactor
        let presenter: RGBPresenter = RGBPresenter()
        let interactor: RGBInteractorProtocol = RGBInteractor()

        // Set up the dependencies
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor

        // Store the viewController instance to avoid multiple instances
        rgbViewControllerInstance = viewController

        return viewController
    }
}






