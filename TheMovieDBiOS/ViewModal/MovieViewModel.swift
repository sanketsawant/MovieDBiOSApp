//
//  MovieViewModel.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieViewModel {
    var movies: [Movie] = []
    var movie: Movie?
    
    func getMovies(completion: @escaping (Bool) -> Void) {
        let urlString = "\(Constants.urlPoint)movie/top_rated?api_key=\(Constants.apiKey)"
        Alamofire.request(urlString).responseString { (response) in
            let movie = Mapper<Movie>().map(JSONString: response.value!)
            print(movie?.backdrop_path!)
        }
    }
}
