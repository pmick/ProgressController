//
//  ViewController.swift
//  iOS Example
//
//  Created by Patrick Mick on 2/23/16.
//  Copyright © 2016 YayNext. All rights reserved.
//

import UIKit
import ProgressController

class ViewController: UIViewController {

    let api = NetworkService()
    
    @IBAction func showButtonTapped(sender: AnyObject) {
        let progressController = ProgressController()
        self.presentViewController(progressController, animated: true, completion: nil)
        
        api.requestData() {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

class NetworkService {
    func requestData(completion: () -> ()) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            completion()
        }
    }
}
