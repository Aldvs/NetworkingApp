//
//  ViewController.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var jsonInfo: Model!
    
    override func viewDidLoad() {
        NetworkingManager.shared.fetchInfo(
            NetworkingManager.shared.ourLink) { parsedInfo in
                self.jsonInfo = parsedInfo
            } // перенести это в метод и вызвать его тут
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else {return}
        infoVC.info = jsonInfo
    }
    
    @IBAction func getInfo() {
    }
    
    @IBAction func getCosoleCheck() {
        fetchData()
    }
    
    private func fetchData() {
        NetworkingManager.shared.fetchInfo(
            NetworkingManager.shared.ourLink) { parsedInfo in
                print(parsedInfo)
            }
    }
}
