# SimplePasscodeView

![GitHub](https://img.shields.io/badge/pod-v0.0.2-blue.svg) ![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg) ![GitHub](https://img.shields.io/badge/platform-iOS-orange.svg)

A Protocol-Oreinted Passcode component provides you with the flexibility of easy integration in your application and customization.

It allows both alphanumerics and emoji entry as passcode. 

## How it works

<img src="https://media.giphy.com/media/LWH6UtIxQP2lFKZvk2/giphy.gif" width="200">    <img src="https://media.giphy.com/media/1ncprJq78LsB2kK1Ok/giphy.gif" width="200"> 

## Usage
### Via Cocoapods

1. Add to your podfile:

`pod 'SimplePasscodeView'`

2. In Terminal, navigate to your project folder, then:

`pod update`

`pod install`

First, import SimplePasscodeView and then declare passcodeView as a IBOutlet property:

```swift
import SimplePasscodeView

class ViewController: UIViewController {
@IBOutlet  weak  var passcode: SimplePasscodeView!
override func viewDidLoad() {
super.viewDidLoad()
passcodeView.delegate = self
}
}

extension ViewController: SimplePasscodeDelegate {
func didFinishEntering(_ passcode: String) {
//Do whatever you want
}
}
```

Drag and drop a `UIView` in your `xib` or `storyboard` and assign the custom class to `SimplePasscodeView`. Follow the steps below:

<img src="https://media.giphy.com/media/6267V73HjBR0N7C6AJ/giphy.gif">

## Customizable Properties

- length -  Pin length that is required. The empty circles will be rendered based on this
- defaultSpacing - Spacing between each circle/pin.
- secureEntry - Masking the entry either secure or not-secure.
- pinfillColor - The color to fill when pin entry is received.( only for secure entry )
- pinborderColor - The border color for the circular indicator.
- pinfont - Font for pin text that is entered.( only if not secure entry )

Other customizable properties available.

### Contributing

- **Star the repo if you would like to follow future updates** 

- **Please feel free to fork the repo and raise a pull request :)**

## Contact

- For any queries drop an email to '**zerogravity.upwork@gmail.com**'

- You can hire me if you need help with any mobile related work.

## Thanks

Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

