//
//  NetworkingManager.swift
//  NetworkingApp
//
//  Created by admin on 17.01.2022.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkingManager {
    
    var ourLink = "https://api.agify.io/?name=bella"
    
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchInfo(_ url: String, complition: @escaping(_ parsedInfo: ModelOne) -> Void ) {
        guard let url = URL(string: ourLink) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let parsedInfo = try JSONDecoder().decode(ModelOne.self, from: data)
                DispatchQueue.main.async {
                    complition(parsedInfo)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchDataWithAlomafire(_ url: String, completion: @escaping(Result<Model, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let info = Model.getModel(from: value)
                    completion(.success(info))
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
