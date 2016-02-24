//
//  ProgressController.swift
//  Next
//
//  Created by Patrick Mick on 12/19/15.
//  Copyright © 2015 Next. All rights reserved.
//

import Foundation

public class ProgressController: UIViewController {
    lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    lazy var progressTransitioningDelegate = ProgressTransitioningDelegate()
   
    // MARK: - Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.activityIndicator)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.activityIndicator.startAnimating()
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.activityIndicator.sizeToFit()
        self.activityIndicator.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        // Normally modalPresentationCapturesStatusBarAppearance would be used,
        // but it doesn't seem to have any effect on custom modal style.
        if let presenting = self.presentingViewController {
            return presenting.preferredStatusBarStyle()
        }
        
        return .Default
    }
    
    // MARK: - Private
    
    private func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self.progressTransitioningDelegate
    }
}
