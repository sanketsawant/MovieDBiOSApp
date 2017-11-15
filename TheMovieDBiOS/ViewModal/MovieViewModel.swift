//
//  MovieViewModel.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class MovieViewModel {
    var movies: [Movie] = []
    var movie: Movie?
    var page:Int = 1
    var maxPage:Int = 1000


    func calculateNextPage() {
        if page < maxPage {
            page += 1
        }
    }
    func getMovies(completion: @escaping (Bool) -> Void) {
        let urlString = "\(Constants.urlPoint)movie/top_rated?api_key=\(Constants.apiKey)&page=\(self.page)"
        
        Alamofire.request(urlString).validate().responseArray(keyPath: "results") { (response: DataResponse<[Movie]>) in
            switch response.result {
            case .success:
                self.movies.append(contentsOf: response.result.value ?? [])
                completion(true)
            case .failure(let error):
                completion(false)
            }
        }
        
    }
}
