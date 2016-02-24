//
//  TestHelpers.swift
//  ProgressController
//
//  Created by Patrick Mick on 2/24/16.
//  Copyright © 2016 YayNext. All rights reserved.
//

import Foundation

class MockPresentingVC: UIViewController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

class StubbedProgressController: ProgressController {
    override var presentingViewController: UIViewController {
        return MockPresentingVC()
    }
}
