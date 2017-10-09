//
//  Super.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import Foundation
import UIKit

struct Super: Codable {
    var code: Int
    var status: String
    var copyright: String
    var attributionText: String
    var attributionHTML: String
    var etag: String
    var data: SuperData
    
    static func endpoint() -> String {
        let timestamp = Date().timestamp
        let apiKey = "5eaf3a695014dfd42d18cc6ebac383a9"
        let privKey = "2ed38947b5d265340341785b3cdee445bfff02f2"
        let hash =  "\(timestamp)\(privKey)\(apiKey)".MD5()
        return "https://gateway.marvel.com:443/v1/public/characters?ts=\(timestamp)&apikey=\(apiKey)&hash=\(hash)"
    }
}

struct SuperThumbnail: Codable {
    var path: String
    var `extension`: String
}

struct SuperResult: Codable {
    var id: Int
    var name: String
    var description: String
    var modified: String
    var thumbnail: SuperThumbnail
    var resourceURI: String
}

struct SuperData: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [SuperResult]
}
