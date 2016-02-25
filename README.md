# ProgressController

![Pod Version](https://img.shields.io/cocoapods/v/ProgressController.svg?style=flat) ![Travis Status](https://travis-ci.org/YayNext/ProgressController.svg?branch=master)

A replacement for MBProgressHUD/SVProgressHUD or similar progress views that leverages UIPresentationController rather than inserting views into your window/view hierarchy.

![ProgressController](https://raw.githubusercontent.com/YayNext/ProgressController/master/preview.gif)

## Installation

### CocoaPods
```
pod 'ProgressController'
```

## Usage

```swift
let progressController = ProgressController()
self.presentViewController(progressController, animated: true, completion: nil)

api.requestData() {
    self.dismissViewControllerAnimated(true, completion: nil)
}
```

## Todo
- [ ] Optional Title View
- [ ] A percent driven style that allows you to display a circular progress view
