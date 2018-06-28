//
//  Movie.swift
//  MoviesApp
//
//  Created by jedi17 on 26/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie: NSObject {
    
    var title: String?
    var image: String?
    var summary: String?
    var price: String?
    var director: String?
    var category: String?
    var categoryId: String?
    var releaseDate: String?
    
    init(json: JSON) {
        self.title = json["title"]["label"].stringValue
        let imageAux = json["im:image"][2]["label"].stringValue
        self.image = imageAux

        self.summary = json["summary"]["label"].stringValue
        self.price = json["im:price"]["label"].stringValue
        self.director = json["im:artist"]["label"].stringValue
        self.category = json["category"]["attributes"]["label"].stringValue
        self.categoryId = json["category"]["attributes"]["im:id"].stringValue
        self.releaseDate = json["im:releaseDate"]["attributes"]["label"].stringValue
    }
}
