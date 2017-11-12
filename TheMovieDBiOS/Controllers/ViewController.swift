//
//  ViewController.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let viewModal: MovieViewModel = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModal.getMovies { (success) in
            print("response time")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

