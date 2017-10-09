//
//  SuperListConfigurator.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation

import UIKit

class SuperListConfigurator: NSObject {
    
    public static let sharedInstance: SuperListConfigurator = {
        let instance = SuperListConfigurator()
        return instance
    }()
    
    func configure(viewController: UIViewController) {
        let viewController = viewController as! SuperListViewController
        
        // Router
        let router = SuperListRouter()
        router.viewController = viewController
        
        // Presenter
        let presenter = SuperListPresenter()
        presenter.router = router
        viewController.presenter = presenter
        
        // Interactor
        let interactor = SuperListInteractor()
        presenter.interactor = interactor
        
        // MARK: - Delegates output
        presenter.delegateOutput = viewController
        interactor.delegateOutput = presenter
    }
    
}
