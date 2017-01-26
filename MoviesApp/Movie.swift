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
    var duration: String?
    var director: String?
    var categoty: String?
    var categoryId: String?
    var releaseDate: String?
    
    init(json: JSON) {
        self.title = json["title"]["label"].stringValue
        
        let imageAux = json["im:image"][0]["label"].stringValue
        let imageHeight = json["im:image"][0]["attributes"]["height"].stringValue
        let auxString = imageHeight + "x" + imageHeight
        
        self.image = imageAux.replacingOccurrences(of: auxString, with: "300x300")
        self.summary = json["summary"]["label"].stringValue
        self.price = json["im:price"]["label"].stringValue
        self.duration = json["link"]["im:duration"].stringValue
        self.director = json["im:artist"]["lable"].stringValue
        self.categoty = json["category"]["label"].stringValue
        self.categoryId = json["category"]["im:id"].stringValue
        self.releaseDate = json["im:releaseDate"]["attributes"]["label"].stringValue
    }
}
