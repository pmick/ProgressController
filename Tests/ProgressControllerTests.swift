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
        let sut = ProgressController()
        XCTAssertEqual(sut.modalPresentationStyle, UIModalPresentationStyle.Custom)
    }
   
    func testProgressController_ShouldHaveAValidTransitioningDelegate() {
        let sut = ProgressController()
        XCTAssertEqual(sut.transitioningDelegate as? ProgressTransitioningDelegate, sut.progressTransitioningDelegate)
    }

    func testStatusBarStyle_ShouldComeFromPresentingViewController() {
        let sut = StubbedProgressController()
        XCTAssertEqual(sut.preferredStatusBarStyle(), UIStatusBarStyle.LightContent)
    }
    
}
