//
//  AlamofireInfoViewController.swift
//  NetworkingApp
//
//  Created by admin on 29.01.2022.
//

import UIKit

class AlamofireInfoViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var labelInfo: UILabel!
    
    //MARK: - Public Properties
    var info: Model!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInfo.text = """
                            Имя: \(info.name ?? "EMPTY")
                            Возраст: \(info.age ?? 0)
                            Число: \(info.count ?? 0)
                        """
    }
    
}
