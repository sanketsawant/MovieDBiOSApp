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
    fileprivate let itemsPerRow: CGFloat = 3
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
        let posterPath = viewModal.movies[indexPath.row].poster_path!
        cell.posterImage.af_setImage(withURL: URL.init(string: "\(Constants.imageUrlPoint)\(posterPath)")!)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 216)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionElementKindSectionFooter {
            self.viewModal.calculateNextPage()
            self.loadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionElementKindSectionFooter {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind,                                                                       withReuseIdentifier: "MovieCollectionViewFooter",for: indexPath) as! MovieCollectionFooterView
            headerView.loadingIndicator.stopAnimating()
        }

    }
/*    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        for cell in self.movieCollectionView.visibleCells {
            let indexPath = self.movieCollectionView.indexPath(for: cell)
            print("\(String(describing: indexPath?.row))     \(self.viewModal.movies.count)")
            if indexPath?.row == self.viewModal.movies.count - 1 {
                self.viewModal.calculateNextPage()
                self.loadData()
            }
            // here add the code whatever you want to do
        }
    }
*/
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
             return UICollectionReusableView.init()
        case UICollectionElementKindSectionFooter:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "MovieCollectionViewFooter",
                                                                             for: indexPath) as! MovieCollectionFooterView
            return headerView

        default:
            assert(false, "Unexpected element kind")
        }
        return UICollectionReusableView.init()
    }

}

