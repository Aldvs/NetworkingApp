//
//  InfoViewController.swift
//  NetworkingApp
//
//  Created by admin on 16.01.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var info: Model!
    
    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelInfo.text = """
                            Имя: \(info.name)
                            Возраст: \(info.age)
                            Число: \(info.count)
                        """
    }
    
    
}
