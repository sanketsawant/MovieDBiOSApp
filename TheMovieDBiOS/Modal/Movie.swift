//
//  Movie.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {

    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection:Any?
    var budget:Double?
    var homepage:String?
    var id:Int?
    var imdb_id:Int?
    var original_language:String?
    var original_title:String?
    var overview:String?
    var popularity:Int?
    var poster_path:String?
    var release_date:String?
    var revenue:Int?
    var runtime:Int?
    var status:String?
    var tagline:String?
    var title:String?
    var video:Bool?
    var vote_average:Int?
    var vote_count:Int?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        belongs_to_collection <- map["belongs_to_collection"]
        budget <- map["budget"]
        homepage <- map["homepage"]
        imdb_id <- map["imdb_id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        status <- map["status"]
        tagline <- map["tagline"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
    
}
