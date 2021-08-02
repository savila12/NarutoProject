//
//  AnimeViewModel.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation

class AnimeViewModel: APIHandlerProtocol {
    
    typealias CompletionHandler = (()->())?
    var dataFromAnime: [Anime]?
    var filteredAnime: [Anime]?
    var delegate: AnimeViewModelProtocol?
    let apiHandler = APIHandler.shared
    var error: Error?
    var searchText: String = ""
    let searchVC = SearchViewController()
    
    
    func didFinishGettingData(model: [Anime], error: Error?) {
        dataFromAnime = model
        delegate?.didFinishWithData()
    }
    
    init(){
        apiHandler.delegate = self
        
    }
    
    func requestData(endPoint: EndPoints, completion: @escaping ([Anime])->()){
        searchVC.passSearchText = {text in
            self.searchText = text
        }
        apiHandler.requestDataForSearch(type: Animes.self, endPoint: endPoint, params: [.query: self.searchText]){ animes in
            guard let animes = animes?.results else {return}
            self.dataFromAnime = animes
            completion(animes)
            
        }
    }
    
//    func fetchDataFromAPI<T>(url: URL, type: T.Type, completion: CompletionHandler) where T: Decodable{
//        
//        apiHandler.fetchData(url: url, type: type) {data, error in
//            let animes = data as? Animes
//            self.dataFromAnime = animes?.results
//            self.error = error
//            completion?()
//        }
//    }
    
    
    func getAnimeCount() -> Int {
        return dataFromAnime?.count ?? 0
    }
    
    func getMovieForCell(at item: Int) -> Anime? {
        guard let anime = dataFromAnime?[item] else {return nil}
        
        return Anime(mal_id: anime.mal_id, url: anime.url, image_url: anime.image_url, title: anime.title, airing: anime.airing, synopsis: anime.synopsis, type: anime.type, episodes: anime.episodes, score: anime.score, start_date: anime.start_date, end_date: anime.end_date, members: anime.members, rated: anime.rated)
    }

}

protocol AnimeViewModelProtocol {
    func didFinishWithData()
}
