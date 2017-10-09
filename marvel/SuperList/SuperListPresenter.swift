//
//  SuperListPresenter.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation
import UIKit

protocol SuperListPresenterOutput: class {
    
}

class SuperListPresenter: SuperListInteractorOutput {
    
    var router: SuperListRouter?
    var interactor: SuperListInteractor?

    weak var delegateOutput: SuperListPresenterOutput?
    
    func getSuperList() {
        interactor?.getSuperListFromMarvel()
    }
    
    // MARK: - SuperListInteractorOutput
    func retrievedSuperList(result: [SuperResult]) {
        print(result)
    }
    
    func couldNotRetrieveSuperList(error: String?) {
        
    }
}
