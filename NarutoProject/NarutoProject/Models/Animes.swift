//
//  Animes.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation

struct Animes: Codable {
    let results: [Anime]?
}

struct Anime: Codable {
    let mal_id: Int?
    let url: String?
    let image_url: String?
    let title: String?
    var airing: Bool? = nil
    let synopsis: String?
    let type: String?
    let episodes: Int?
    var score: Float? = nil
    let start_date: String?
    var end_date: String? = nil
    let members: Int?
    let rated: String?
}
