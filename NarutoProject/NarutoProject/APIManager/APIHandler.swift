//
//  APIHandler.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation

class APIHandler {
    typealias CompletionHandler = ((Any?, Error?)->())?
    
    static let shared = APIHandler()
    private init (){}

    var delegate: APIHandlerProtocol?
    
    func fetchData<T>(url: URL, type: T.Type, completion: CompletionHandler) where T: Decodable{
        
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
