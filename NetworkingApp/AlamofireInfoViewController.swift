//
//  AlamofireInfoViewController.swift
//  NetworkingApp
//
//  Created by admin on 29.01.2022.
//

import UIKit

class AlamofireInfoViewController: UIViewController {

    @IBOutlet weak var labelInfo: UILabel!
    
    var info: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInfo.text = """
                            Имя: \(info.name)
                            Возраст: \(info.age)
                            Число: \(info.count)
                        """
    }
    
}
