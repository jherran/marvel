//
//  SuperDetailConfigurator.swift
//  marvel
//
//  Created by Jose A. Herran on 11/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation
import UIKit

class SuperDetailConfigurator: NSObject {
    
    public static let sharedInstance: SuperDetailConfigurator = {
        let instance = SuperDetailConfigurator()
        return instance
    }()
    
    func configure(viewController: UIViewController, hero: SuperResult, image: UIImage) {
        let viewController = viewController as! SuperDetailViewController
        viewController.hero = hero
        viewController.image = image
    }
    
}
