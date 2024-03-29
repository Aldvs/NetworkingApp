//
//  ViewController.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Private Properties
    private var jsonInfo: ModelOne!
    private var alamofireInfo: Model!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        fetchData()
        fetchAlamofireData()
    }
    
    //MARK: - NAvigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "jsonParsing":
            guard let infoVC = segue.destination as? InfoViewController else { return }
            infoVC.info = jsonInfo
        default:
            guard let alamofireInfoVC = segue.destination as? AlamofireInfoViewController else { return }
            alamofireInfoVC.info = alamofireInfo
        }
    }
    
    //MARK: - IB Actions
    @IBAction func getCosoleCheck() {
        fetchData()
    }
    
    //MARK: - Private Methods
    private func fetchData() {
        NetworkingManager.shared.fetchInfo(
            NetworkingManager.shared.ourLink) { parsedInfo in
                self.jsonInfo = parsedInfo
                print(parsedInfo)
            }
    }
    
    private func fetchAlamofireData() {
        NetworkingManager.shared.fetchDataWithAlomafire(NetworkingManager.shared.ourLink) { result in
            switch result {
            case .success(let model):
                self.alamofireInfo = model
            case .failure(let error):
                print(error)
            }
        }
    }
}
