

![](http://i.imgur.com/GHkQixd.png)

## ColorPicKit

#### UIControls

Provides several UIControls for defining and selecting colors:
* ImagePixelPicker - Obtain the color of any individual pixel.
* HSBWheel - Hue vs saturation.
* HSBSpectrum - Hue vs brightness & saturation where
    * y = hue
    * x = saturation from 0.0 ..< 0.5
    * x = brightness from 0.5 >.. 1.0
* RGBSliderGroup - 3 sliders to define red, green, and blue components.
* HSBSliderGroup - 3 sliders to define hue, saturation, and brightness components.
* CMYKSliderGroup - 4 sliders to define cyan, magenta, yellow, and black components.
* GradientSlider - Interpolates a color between the two colors on the ends.
* HueSlider - Select a hue value.

#### UIColor utilities

ColorPicKit also exposes several functions and data structures for working with hex strings, RGB, HSB, and CMYK, and interpolating a color between two known colors.

````

extension UIColor {

    public convenience init(hexString:String)
    public convenience init(rgb: RGB, alpha: CGFloat = 1.0)
    public convenience init(hsb: HSB, alpha: CGFloat = 1.0)
    public convenience init(cmyk: CMYK, alpha: CGFloat = 1.0)

    public func hexString() -> String
    public func rgb() -> RGB
    public func hsb() -> HSB
    public func cmyk() -> CMYK

    public class func colorWith(hexString: String, alpha: CGFloat = 1.0) -> UIColor
    public class func colorWith(rgb: RGB, alpha: CGFloat = 1.0) -> UIColor
    public class func colorWith(hsb: HSB, alpha: CGFloat = 1.0) -> UIColor
    public class func colorWith(cmyk: CMYK, alpha: CGFloat = 1.0) -> UIColor

    public class func interpolateAt(value: CGFloat, betweenColor1 color1: UIColor, andColor2 color2: UIColor) -> UIColor
    public class func rgbToCMYK(rgb: RGB) -> CMYK
    public class func rgbToHSB(rgb: RGB) -> HSB
    public class func hsbToRGB(hsb: HSB) -> RGB
    public class func hsbToCMYK(hsb: HSB) -> CMYK
    public class func cmykToRGB(cmyk: CMYK) -> RGB
    public class func cmykToHSB(cmyk: CMYK) -> HSB

}

````

RGB, HSB, and CMYK are defined as tuples

````

public typealias RGB = (red: CGFloat, green: CGFloat, blue: CGFloat)
public typealias CMYK = (cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat)
public typealias HSB = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat)

````

#### UIImage and CVPixelBuffer utilities

Additionally, I've exposed instance methods and class functions which allow you to convert UIImage to CVPixelBuffer, get CVPixelBuffer properties, and query a pixel color.

````

extension UIImage {

    // Class functions
    public class func pixelBufferOf(image: UIImage) -> CVPixelBuffer?
    public class func pixelBufferPropertiesOf(image: UIImage) -> (pixelBuffer: CVPixelBuffer?, size:CGSize, bytesPerRow: Int)
    public class func getSizeOf(pixelBuffer: CVPixelBuffer) -> CGSize
    public class func getBytesPerRowOf(pixelBuffer: CVPixelBuffer) -> Int
    public class func pixelColorOf(image: UIImage, at point: CGPoint) -> UIColor?

    // Instance methods
    public func pixelBuffer() -> CVPixelBuffer? {
    public func pixelColorAt(point: CGPoint) -> UIColor? {
    public func pixelBufferProperties() -> (pixelBuffer: CVPixelBuffer?, size:CGSize, bytesPerRow: Int)

}

````

## Usage

#### InterfaceBuilder
- Drag and drop a UIView onto your view controller
- Set the view's class to GradientSlider, HueSlider, RGBSliderGroup, HSBSliderGroup, CMYKSliderGroup, HSBWheelPicker, HSBSpectrumPicker, or ImagePixelPicker.
- Using the Attributes Inspector, configure IB properties (color, rounded corners, border color, etc...)
- Drag and drop your IBActions just like any other control. All controls support
  - ValueChanged
  - TouchDown
  - TouchUpInside

#### Programmatically
- Create an instance of GradientSlider, HueSlider, RGBSliderGroup, HSBSliderGroup, CMYKSliderGroup, HSBWheelPicker, HSBSpectrumPicker, or ImagePixelPicker using init(frame) or init(coder).
- Use addTarget() to receive ValueChanged, TouchDown, or TouchUpInside

````
func setupWheel() {
    self.hsbWheel = HSBWheel(frame: self.view.bounds)
    hsbWheel.addTarget(self, action: #selector(hsbWheelValueChanged), for: .valueChanged)
}
func hsbWheelValueChanged(sender: HSBWheel) {
    let color = sender.color
}
````

## Example

ColorPicKit includes a full example project. Clone this repository and open ColorPicKitExample.xcodeproj

## Cocoapods

This pod is not yet in the cocooapods trunk, so you will need to be install it using a tag.

````
pod 'ColorPicKit', :git => 'https://github.com/zakkhoyt/ColorPicKit', :tag => '1.1'
````

Alternatively you can use the unstable master branch:

````
pod 'ColorPicKit', :git => 'https://github.com/zakkhoyt/ColorPicKit', :branch => 'master'
````

## Interface Builder Images
### ImagePixelPicker
![IB](http://i.imgur.com/Mf9Laoj.png)

### HSBWheel
![IB](http://i.imgur.com/STCTD02.png)

### HSBSpectrum
![IB](http://i.imgur.com/AAL8lMB.png)

### RGBSliderGroup
![IB](http://i.imgur.com/rCY68tR.png)

### HSBSliderGroup
![IB](http://i.imgur.com/SL0F2DT.png)

### CMYKSliderGroup
![IB](http://i.imgur.com/t3vyZvY.png)

### GradientSlider
![IB](http://i.imgur.com/BJjK7Me.png)

### HueSlider
![IB](http://i.imgur.com/YJuVTFX.png)


## Images in use
### ImagePixelPicker
![In use](http://i.imgur.com/8yaZiBF.png)

### HSBWheel
![In use](http://i.imgur.com/AVtix56.png)

### HSBSpectrum
![In use](http://i.imgur.com/Rak6ukf.png)

### RGBSliderGroup
![In use](http://i.imgur.com/jUmgXb0.png)

### HSBSliderGroup
![In use](http://i.imgur.com/PFIWWLa.png)

### CMYKSliderGroup
![In use](http://i.imgur.com/jWvX44n.png)

### GradientSlider
![In use](http://i.imgur.com/hX2MQ9q.png)

### HueSlider
![In use](http://i.imgur.com/7IUiq1b.png)
