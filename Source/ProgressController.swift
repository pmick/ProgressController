//
//  ProgressController.swift
//  Next
//
//  Created by Patrick Mick on 12/19/15.
//  Copyright © 2015 Next. All rights reserved.
//

import Foundation

class ProgressController: UIViewController {
    lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    lazy var progressTransitioningDelegate = ProgressTransitioningDelegate()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }

    func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self.progressTransitioningDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.activityIndicator)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.activityIndicator.startAnimating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.activityIndicator.sizeToFit()
        self.activityIndicator.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
    }
    
    func dismiss(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        if let vc = self.presentingViewController {
            vc.dismissViewControllerAnimated(flag, completion: completion)
        }
    }
}
