//
//  SuperDetailViewController.swift
//  marvel
//
//  Created by Jose A. Herran on 11/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation
import UIKit

class SuperDetailViewController: UIViewController {
    
    var hero: SuperResult?
    var image: UIImage?
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configView() {
        heroImage.image = image
        heroName.text = hero?.name
        if hero?.description != "" {
            heroImage.alpha = 0.3
            heroDescription.text = hero?.description
        } else {
            heroName.textColor = UIColor.yellow
        }
    }

}

