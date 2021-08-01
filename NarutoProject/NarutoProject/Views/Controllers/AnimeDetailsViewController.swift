//
//  AnimeDetailsViewController.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import UIKit

class AnimeDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var airingLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    
    var animeVM: AnimeDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setAnime(anime: Anime) {
        animeVM = AnimeDetailsViewModel()
        animeVM?.delegate = self
        animeVM?.setMovieObject(anime: anime)
        
    }
 

}

extension AnimeDetailsViewController: AnimeDetailsViewModelProtocol {
    func didReceiveAnime(anime: Anime) {
        DispatchQueue.main.async {
            self.titleLabel.text = "Title: \(anime.title ?? "N/A")"
            self.typeLabel.text = "Type: \(anime.type ?? "N/A")"
            self.scoreLabel.text = "Score: \(anime.score?.description ?? "N/A")"
            self.airingLabel.text = "Airing: \(anime.airing?.description ?? "N/A")"
            self.endDateLabel.text = "End Date: \(anime.end_date ?? "N/A")"
            self.synopsis.text = anime.synopsis ?? "N/A"
            
            self.imgView.sd_setImage(with: URL(string: "\(anime.image_url ?? "")"), completed: nil)
            
            
        }
    }
    
    
}
