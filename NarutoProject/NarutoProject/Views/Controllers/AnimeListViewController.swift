//
//  ViewController.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//
import UIKit
import SDWebImage

class AnimeListViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    var animeVM = AnimeViewModel.init()
    var searchVC: SearchViewController?
    
    override func viewDidLoad() {
        self.title = "Anime List"
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
//        animeVM.fetchDataFromAPI(url: URL.init(string: Constants.url.rawValue)!, type: Animes.self){
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
        
        animeVM.requestData(endPoint: .home) {_ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        setupRightNavBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        animeVM.requestData(endPoint: .search) { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func setupRightNavBtn(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Search", style: .plain, target: self, action: #selector(goToSearchView))
    }
    
    @objc func goToSearchView(){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController")
        present(vc, animated: true, completion: nil)
    }


}

extension AnimeListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animeVM.getAnimeCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionView
        
        cell?.layer.cornerRadius = 6
        
        cell?.animeObject = animeVM.getMovieForCell(at: indexPath.item)
        
        return cell ?? UICollectionViewCell()
    }
    
    

}

