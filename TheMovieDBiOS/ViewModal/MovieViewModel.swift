//
//  MovieViewModel.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import Foundation
import Alamofire

class MovieViewModel {
    var movies: [Movie] = []
    var movie: Movie?
    
    func getMovies(completion: @escaping (Bool) -> Void) {
        var urlString = "\(Constants.urlPoint)/language=en-US/api_key=\(Constants.apiKey)"
        Alamofire.request("https://httpbin.org/get")
//        Alamofire.z
        
        
    }
}
