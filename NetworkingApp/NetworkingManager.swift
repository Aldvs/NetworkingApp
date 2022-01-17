//
//  NetworkingManager.swift
//  NetworkingApp
//
//  Created by admin on 17.01.2022.
//

import UIKit

class NetworkingManager {
    
    var ourLink = "https://api.agify.io/?name=bella"
    
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchInfo(_ url: String, complition: @escaping(_ parsedInfo: Model) -> Void ) {
        guard let url = URL(string: ourLink) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let parsedInfo = try JSONDecoder().decode(Model.self, from: data)
                DispatchQueue.main.async {
                    complition(parsedInfo)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
