//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by Vedant Jain on 14/07/19.
//  Copyright © 2019 Vedant Jain. All rights reserved.
//

import UIKit
import Alamofire

struct Metadata: Codable {
    let alt: String?
    let day: Int?
    let img: String?
    let link: String?
    let month: Int?
    let news: String?
    let num: Int?
    let safe_title: String?
    let title: String?
    let transcript: String?
    let year: Int?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networking()
    }
    
    func networking() {
        
        let url = "https://xkcd.com/614/info.0.json"
        
        let headers = [
            "Content-type": "application/json"
        ]
        
        Alamofire.request(url, method: .get, parameters: nil, headers: headers).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let response = try JSONDecoder().decode(Metadata.self, from: data)
                            print(response.title ?? "Whoops! No title found.")
                        }
                        catch let error {
                            print("error: ", error)
                        }
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
            }
        }
        
    }
    
    
}

