//
//  CollectionFooterView.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 17/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import UIKit

class MovieCollectionFooterView: UICollectionReusableView {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!

    override func awakeFromNib() {
        loadingIndicator.startAnimating()
    }
}
