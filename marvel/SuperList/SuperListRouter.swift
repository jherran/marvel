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
    
    func showSuperDetailFor(hero: SuperResult, image: UIImage) {
        viewController.performSegue(withIdentifier: "ShowSuperDetailSegue", sender: ["hero": hero, "image": image])
    }
}

extension SuperListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController {
            let viewController = navigationController.topViewController as! SuperDetailViewController
            if let dic = sender as? Dictionary<String, AnyObject> {
                SuperDetailConfigurator.sharedInstance.configure(viewController: viewController, hero: dic["hero"] as! SuperResult, image: dic["image"] as! UIImage)
            }
        } else if let viewController = segue.destination as? SuperDetailViewController {
            if let dic = sender as? Dictionary<String, AnyObject> {
                SuperDetailConfigurator.sharedInstance.configure(viewController: viewController, hero: dic["hero"] as! SuperResult, image: dic["image"] as! UIImage)
            }
        }
    }
}
