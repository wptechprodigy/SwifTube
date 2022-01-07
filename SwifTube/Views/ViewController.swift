//
//  ViewController.swift
//  SwifTube
//
//  Created by waheedCodes on 06/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }
}
