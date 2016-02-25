# ProgressController
A replacement for MBProgressHUD/SVProgressHUD or similar progress views that leverages UIPresentationController rather than inserting views into your window/view hierarchy.

![ProgressController](https://raw.githubusercontent.com/YayNext/ProgressController/master/preview.gif)

## Installation

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

