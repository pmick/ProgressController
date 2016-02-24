//
//  ProgressControllerTests.swift
//  ProgressController
//
//  Created by Patrick Mick on 2/23/16.
//  Copyright © 2016 YayNext. All rights reserved.
//

import XCTest
@testable import ProgressController

class ProgressControllerTests: XCTestCase {

    func testProgressModalPresentationStyle_ShouldBeCustom() {
        let progressController = ProgressController()
        XCTAssertEqual(progressController.modalPresentationStyle, UIModalPresentationStyle.Custom)
    }
   
    func testProgressController_ShouldHaveAValidTransitioningDelegate() {
        let progressController = ProgressController()
        XCTAssertEqual(progressController.transitioningDelegate as? ProgressTransitioningDelegate, progressController.progressTransitioningDelegate)
    }

    func testStatusBarStyle_ShouldComeFromPresentingViewController() {
        let sut = StubbedProgressController()
        XCTAssertEqual(sut.preferredStatusBarStyle(), UIStatusBarStyle.LightContent)
    }
    
}
