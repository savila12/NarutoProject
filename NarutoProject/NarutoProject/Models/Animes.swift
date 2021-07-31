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
    let airing: Bool?
    let synopsis: String?
    let type: String?
    let episodes: Int?
    let score: Float?
    let start_date: String?
    let end_date: String?
    let members: Int?
    let rated: String?
}
