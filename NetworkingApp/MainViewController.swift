//
//  ViewController.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var ourLink = "https://api.agify.io/?name=bella"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else {return}
        infoVC.info = fetchInfo()
    }
}

//MARK: - Extensions
extension MainViewController {
    
    private func fetchInfo() -> Model {
        guard let url = URL(string: ourLink) else { return Model(name: "Error", age: 1, count: 1) }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard let temp = try? JSONDecoder().decode(Model.self, from: data) else {
                return
            }

        }.resume()
    }

    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}
