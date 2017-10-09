//
//  SuperListRouter.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation
import UIKit


class SuperListRouter {
    
    var viewController: UIViewController!
    
    func showSuperDetail() {
        viewController.performSegue(withIdentifier: "ShowSuperDetail", sender: nil)
    }
    
}
