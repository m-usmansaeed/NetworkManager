//
//  ViewController.swift
//  NetworkManager
//
//  Created by M Usman Saeed on 28/03/2018.
//  Copyright © 2018 SAS Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.callApi("latlng=40.714224,-73.961452&key=APP_KEY", httpMethod: .get, parameters: [:], success: { (response) in
            
            print(response)
            
        }) { (error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

