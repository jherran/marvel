//
//  SuperListInteractor.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation

protocol SuperListInteractorOutput: class {
    func retrievedSuperList(result: [SuperResult])
    func couldNotRetrieveSuperList(error: String?)
}

class SuperListInteractor: NSObject {
    
    weak var delegateOutput: SuperListInteractorOutput?    
    
    func getSuperListFromMarvel() {
        let endpoint = Super.endpoint()
        guard let url = URL(string: endpoint) else {
            self.delegateOutput?.couldNotRetrieveSuperList(error: "Error: cannot create URL")
            return
        }

        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            guard error == nil else {
                self.delegateOutput?.couldNotRetrieveSuperList(error: error?.localizedDescription)
                return
            }
            guard let responseData = data else {
                self.delegateOutput?.couldNotRetrieveSuperList(error: "Error: did not receive data")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                var superList = try decoder.decode(Super.self, from: responseData)
                // quick fix to avoid adding app transport security
                for i in 0...superList.data.results.count - 1 {
                    superList.data.results[i].thumbnail.path = superList.data.results[i].thumbnail.path.replacingOccurrences(of: "http://", with: "https://")
                }
                self.delegateOutput?.retrievedSuperList(result: superList.data.results)
            } catch {
                self.delegateOutput?.couldNotRetrieveSuperList(error: "Error: trying to convert data to JSON")
            }
        })
        task.resume()
    }
}
