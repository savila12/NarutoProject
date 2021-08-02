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
    case search
}

enum QueryParams: String {
    case query
}

let endPointList: [EndPoints: EndPoint] = [
    .search: EndPoint(scheme: "https", host: Constants.baseUrl.rawValue, path: "/v3/search/anime", query: [])
]
