//
//  ViewController.swift
//  completion_handler
//
//  Created by Vedant Jain on 14/07/19.
//  Copyright © 2019 Vedant Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        networking(parameters: "Specify any parameters here") { (returnInt) in
            // returnInt is the value sent by the completion block of the function
            // 4
            print(returnInt)
        }
    }
    
    private func networking(parameters: String, completion: @escaping (Int) -> Void) {
        
        // make networking calls here
        
        firstNetworkCall(parameters: parameters) { (returnInt) in
            // returnInt is the value sent by the completion block of the function
            // 1
            print(returnInt)
            // balance the .enter() call inside the function
            self.dispatchGroup.leave()
        }
        
        secondNetworkCall(parameters: parameters) { (returnInt) in
            // returnInt is the value sent by the completion block of the function
            // 2
            print(returnInt)
            // balance the .leave() call inside the function
            self.dispatchGroup.leave()
        }
        
        // when
        dispatchGroup.notify(queue: .main) {
            print(3)
            completion(4)
        }
        
    }
    
    private func firstNetworkCall(parameters: String, completion: @escaping (Int) -> Void) {
        
        // first networking call
        // make a call here and put the completion block inside the .success block
        // remember to handle cases when an error occurs
        
        dispatchGroup.enter()
        
        completion(1)
        
    }
    
    private func secondNetworkCall(parameters: String, completion: @escaping (Int) -> Void) {
        
        // second networking call
        // make a call here and put the completion block inside the .success block
        // remember to handle cases when an error occurs
        
        dispatchGroup.enter()
        
        completion(2)
        
    }

}

