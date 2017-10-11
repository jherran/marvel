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
    func superList(result: [SuperResult])
    func superError(error: String?)
}

class SuperListPresenter: SuperListInteractorOutput {
    
    var router: SuperListRouter?
    var interactor: SuperListInteractor?

    weak var delegateOutput: SuperListPresenterOutput?
    
    func getSuperList() {
        interactor?.getSuperListFromMarvel()
    }
    
    func goToDetailWith(hero: SuperResult, image: UIImage) {
        router?.showSuperDetailFor(hero: hero, image: image)
    }
    
    // MARK: - SuperListInteractorOutput
    func retrievedSuperList(result: [SuperResult]) {
        delegateOutput?.superList(result: result)
    }
    
    func couldNotRetrieveSuperList(error: String?) {
        delegateOutput?.superError(error: error)
    }
}
