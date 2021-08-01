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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        animeVM.fetchDataFromAPI(url: URL.init(string: Constants.url.rawValue)!, type: Animes.self){
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "AnimeDetailsViewController") as? AnimeDetailsViewController
        
        guard let anime = animeVM.getMovieForCell(at: indexPath.item) else {return}
        vc?.setAnime(anime: anime)
        navigationController?.present(vc!, animated: true, completion: nil)
    }
    
    
}

