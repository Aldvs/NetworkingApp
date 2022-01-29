//
//  InfoViewController.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var labelInfo: UILabel!
    
    //MARK: - Public Properties
    var info: ModelOne!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        labelInfo.text = """
                            Имя: \(info.name)
                            Возраст: \(info.age)
                            Число: \(info.count)
                        """
    }
    
    
}
