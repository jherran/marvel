//
//  SuperListTableViewCell.swift
//  marvel
//
//  Created by Jose A. Herran on 11/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import UIKit


class SuperListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    class func cellIdentifier() -> String {
        return "SuperListTableViewCellIdentifier"
    }
    
    // MARK: View lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // settings view
    }
    
    func configureCell(hero: SuperResult) {
        heroName.text = hero.name
        
        let stringURL = hero.thumbnail.path + "." + hero.thumbnail.`extension`
        heroImage.imageFrom(stringURL: stringURL)
    }
}
