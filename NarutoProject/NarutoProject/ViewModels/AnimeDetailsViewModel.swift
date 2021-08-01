//
//  AnimeDetailsViewModel.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation

class AnimeDetailsViewModel {
    var delegate: AnimeDetailsViewModelProtocol?
    
    var animeObject: Anime? {
        didSet {
            guard let anime = animeObject else {return}
            delegate?.didReceiveAnime(anime: anime)
        }
    }
    
    func updateAnimeObject(anime: Anime, completion: @escaping (Anime)->()) {
        guard let id = anime.mal_id else {return}
        
        APIHandler.shared.fetchData(url: URL.init(string: Constants.url.rawValue)!, type: Animes.self, movieId: id) { response, _ in
            guard let response = (response as? Anime) else {return}
            var updateAnime = anime
            updateAnime.score = response.score
            updateAnime.end_date = response.end_date
            updateAnime.airing = response.airing
            completion(updateAnime)
            
        }
    }
    
    func setMovieObject(anime: Anime) {
        self.updateAnimeObject(anime: anime){ anime in
            self.animeObject = anime
        }
    }
    
    func getPosterImage() -> Data? {
        
        if let url = URL(string: animeObject?.image_url ?? "" ){
            if let data = try? Data(contentsOf: url) {
                return data
            }
        }
        return nil
    }
}

protocol AnimeDetailsViewModelProtocol {
   func didReceiveAnime(anime: Anime)
}
