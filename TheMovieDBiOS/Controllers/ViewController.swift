//
//  ViewController.swift
//  TheMovieDBiOS
//
//  Created by Sanket on 06/11/17.
//  Copyright © 2017 TheMovieDBiOS. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    let viewModal: MovieViewModel = MovieViewModel()
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let reuseIdentifier = "movieDetailsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.delegate = self
        self.loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    func loadData() -> Void {
        viewModal.getMovies { (success) in
            self.movieCollectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModal.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieDetailsCustomCell
        cell.backgroundColor = UIColor.white
        cell.originalTitle.text = viewModal.movies[indexPath.row].original_title
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 167, height: 216)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}

