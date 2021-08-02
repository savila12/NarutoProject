//
//  APIHandler.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation

class APIHandler {
    typealias CompletionHandler = ((Any?, Error?)->())?
    
    static let shared = APIHandler.init()
    private init (){}

    var delegate: APIHandlerProtocol?
    
    func createUrl(endPoint: EndPoints, params: [QueryParams:String]) -> URL? {
        guard let component = endPointList[endPoint] else {return nil}
        var components = URLComponents()
        components.scheme = component.scheme
        components.host = component.host
        components.path = component.path
        components.queryItems = component.query
        if !params.isEmpty {
            params.forEach{components.queryItems?.append(URLQueryItem(name: $0.rawValue, value: $1))}
        }
        guard let url = components.url else {return nil}
        return url
    }
    
    func requestDataForSearch<T>(type: T.Type, endPoint: EndPoints, params: [QueryParams: String], completion: @escaping (T?)->()) where T: Decodable {
        
        guard let url = createUrl(endPoint: endPoint, params: params) else {return}
        
        URLSession.shared.dataTask(with: url){data, _, error in
            DispatchQueue.main.async {
                if data != nil && error == nil{
                let model = try! JSONDecoder.init().decode(type, from: data!)
                completion(model)
                }
            }
        }.resume()
    }
    
    func fetchData<T>(url: URL, type: T.Type, movieId: Int? = nil, completion: CompletionHandler) where T: Decodable{
        
        var request = URLRequest.init(url: url)
        //Give Api a certain amount of time before timing out
        request.timeoutInterval = 100
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            DispatchQueue.main.async {
                if data != nil && error == nil {
                    let model = try! JSONDecoder.init().decode(type, from: data!)
                    completion?(model, error)
                } else {
                    completion?(nil, error)
                }
            }
            
        }.resume()
    }
}

protocol APIHandlerProtocol {
    func didFinishGettingData(model: [Anime], error: Error?)
}
