//
//  Endpoints.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 8/1/21.
//

import Foundation

struct EndPoint {
    let scheme: String
    let host: String
    let path: String
    var query: [URLQueryItem]
}

enum EndPoints {
    case home
    case search
}

enum QueryParams: String {
    case query
}

/// Parts of url components to be used to pieced together
/// Get an example of url to make sure it is EXACTLY the same
let endPointList: [EndPoints: EndPoint] = [
    .home: EndPoint(scheme: "https", host: Constants.baseUrl.rawValue, path: "/v3/search/anime", query: [URLQueryItem(name: "q", value: "naruto")]),
    
    .search: EndPoint(scheme: "https", host: Constants.baseUrl.rawValue, path: "/v3/search/anime", query: [])
]
