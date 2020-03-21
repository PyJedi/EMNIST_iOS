import UIKit
import PlaygroundSupport
import CoreML

public class PredViewController: UIViewController {
    
    
    let predictLabel = UILabel()
    let model = emnist_model1_FP8_2()
    
    var lastPoint: CGPoint = .zero
    var swiped = false
    var brushWidth = CGFloat(15)
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        messview.isHidden = true
        guard let touch = touches.first else { return }
        lastPoint = touch.location(in: canvasImageView)
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        guard let touch = touches.first else { return }
        let currentPoint = touch.location(in: canvasImageView)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !swiped else { return }
        drawLine(from: lastPoint, to: lastPoint)
    }
    
    var canvasImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()
    
    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(canvasImageView.frame.size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        canvasImageView.image?.draw(in: .init(origin: .zero, size: canvasImageView.frame.size))
        
        context?.setLineCap(.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1)
        context?.setBlendMode(.normal)
        
        context?.move(to: startPoint)
        context?.addLine(to: endPoint)
        context?.strokePath()
        
        canvasImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        canvasImageView.alpha = 1
        UIGraphicsEndImageContext()
    }
    
    @objc func didTapClearButton() {
        canvasImageView.image = nil
    }
    
    public lazy var predbutton: UIButton = {
        let predbutton = UIButton()
        predbutton.frame = CGRect(x: 219, y: 480, width: 162, height: 52)
        predbutton.setImage(UIImage(named: "predict_button"), for: .normal)
        predbutton.addTarget(self, action: #selector(predbuttontapped(_:)), for: .touchUpInside)
        return predbutton
    }()
        
    public lazy var clearbutton: UIButton = {
        let clearbutton = UIButton()
        clearbutton.frame = CGRect(x: 220, y: 564, width: 162, height: 52)
        clearbutton.setImage(UIImage(named: "pred_clear"), for: .normal)
        clearbutton.addTarget(self, action: #selector(clearbuttontapped(_:)), for: .touchUpInside)
        return clearbutton
    }()
    
    public lazy var messview : UIImageView = {
        let message = UIImage(named: "canvas_info.png")
        let messview = UIImageView(image: message!)
        messview.frame = CGRect(x: 239, y: 229, width: 124, height: 120)
        return messview
    }()
    
    
    @objc func predbuttontapped(_ sender: UIButton){
        let size = CGSize(width: 28, height: 28)
        let image = canvasImageView.image?.resize(to: size)
        guard let buffer = image?.resize(to: size)?.pixelBuffer() else { return }
        
        func printDate(string: String) {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss.SSSS"
            print(string + formatter.string(from: date))
        }
        
        //printDate(string: "init:  ")
        let timestamp1 = CACurrentMediaTime()
        
        guard let result = try? model.prediction(input1: buffer) else { return }
        
        let timestamp2 = CACurrentMediaTime()
        
        print(timestamp2 - timestamp1)
        
        //printDate(string: "end:  ")
        
        //predictLabel.text = result.classLabel
        //print(predictLabel.text!)
        predictLabel.isHidden = false
    }
        
    @objc func clearbuttontapped(_ sender: UIButton){
        canvasImageView.image = nil
        predictLabel.isHidden = true
        messview.isHidden = false
    }
    
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        predictLabel.isHidden = true
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
        view.backgroundColor = .white
        view.alpha = 1
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        
        let buttonrect = UIView()
        buttonrect.frame = CGRect(x: 219, y: 480, width: 162, height: 52)
        buttonrect.clipsToBounds = true
        buttonrect.layer.cornerRadius = 15
        buttonrect.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        buttonrect.alpha = 1
        
        let viewShadow = UIView(frame: CGRect(x: 219, y: 480, width: 162, height: 52))
        viewShadow.center = buttonrect.center
        viewShadow.backgroundColor = UIColor.black
        viewShadow.layer.cornerRadius = 15
        viewShadow.layer.shadowColor = UIColor.darkGray.cgColor
        viewShadow.layer.shadowOpacity = 0.5
        viewShadow.layer.shadowOffset = CGSize.zero
        viewShadow.layer.shadowRadius = 20
        
        let buttonrect2 = UIView()
        buttonrect2.frame = CGRect(x: 220, y: 649, width: 162, height: 52)
        buttonrect2.clipsToBounds = true
        buttonrect2.layer.cornerRadius = 15
        buttonrect2.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        buttonrect2.alpha = 1
        
        let viewShadow2 = UIView(frame: CGRect(x: 220, y: 649, width: 162, height: 52))
        viewShadow2.center = buttonrect2.center
        viewShadow2.backgroundColor = UIColor.black
        viewShadow2.layer.cornerRadius = 15
        viewShadow2.layer.shadowColor = UIColor.darkGray.cgColor
        viewShadow2.layer.shadowOpacity = 0.5
        viewShadow2.layer.shadowOffset = CGSize.zero
        viewShadow2.layer.shadowRadius = 20
        
        let buttonrect3 = UIView()
        buttonrect3.frame = CGRect(x: 220, y: 564, width: 162, height: 52)
        buttonrect3.clipsToBounds = true
        buttonrect3.layer.cornerRadius = 15
        buttonrect3.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        buttonrect3.alpha = 1
        
        let viewShadow4 = UIView(frame: CGRect(x: 220, y: 564, width: 162, height: 52))
        viewShadow4.center = buttonrect3.center
        viewShadow4.backgroundColor = UIColor.black
        viewShadow4.layer.cornerRadius = 15
        viewShadow4.layer.shadowColor = UIColor.darkGray.cgColor
        viewShadow4.layer.shadowOpacity = 0.5
        viewShadow4.layer.shadowOffset = CGSize.zero
        viewShadow4.layer.shadowRadius = 20
        
        let canvrect = UIView()
        canvrect.frame = CGRect(x: 147, y: 129, width: 308, height: 308)
        canvrect.clipsToBounds = true
        canvrect.layer.cornerRadius = 20
        canvrect.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        canvrect.alpha = 1
        
        let viewShadow3 = UIView(frame: CGRect(x: 147, y: 129, width: 308, height: 308))
        viewShadow3.center = canvrect.center
        viewShadow3.backgroundColor = UIColor.white
        viewShadow3.layer.cornerRadius = 20
        viewShadow3.layer.shadowColor = UIColor.darkGray.cgColor
        viewShadow3.layer.shadowOpacity = 0.5
        viewShadow3.layer.shadowOffset = CGSize.zero
        viewShadow3.layer.shadowRadius = 20
        
        let arc = UIImage(named: "arc_pred.png")
        let arcview = UIImageView(image: arc!)
        arcview.frame = CGRect(x: 0, y: 4, width: 600, height: 796)
        view.addSubview(arcview)
        
        let title = UIImage(named: "pred title.png")
        let titleview = UIImageView(image: title!)
        titleview.frame = CGRect(x: 195, y: 52, width: 211, height: 46)
        view.addSubview(titleview)
        
        view.addSubview(viewShadow2)
        view.addSubview(viewShadow3)
        view.addSubview(viewShadow4)
        view.addSubview(viewShadow)
        view.addSubview(buttonrect)
        view.addSubview(buttonrect2)
        view.addSubview(buttonrect3)
        view.addSubview(titleview)
        view.addSubview(predbutton)
        view.addSubview(clearbutton)
        view.addSubview(canvasImageView)
        view.addSubview(messview)
        canvasImageView.frame = CGRect(x: 159, y: 148, width: 282, height: 282)
        canvasImageView.center = canvrect.center
        canvasImageView.backgroundColor = UIColor.white
        
        view.addSubview(predictLabel)
        predictLabel.frame = CGRect(x: 159, y: 148, width: 282, height: 282)
        predictLabel.center = canvrect.center
        predictLabel.backgroundColor = UIColor.white
        predictLabel.clipsToBounds = true
        predictLabel.font = predictLabel.font.withSize(200)
        predictLabel.textAlignment = .center
        predictLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
    }
    
}


extension UIImage {
    func pixelBuffer() -> CVPixelBuffer? {
        let width = self.size.width
        let height = self.size.height
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                     kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(width),
                                         Int(height),
                                         kCVPixelFormatType_OneComponent8,
                                         attrs,
                                         &pixelBuffer)
        
        guard let resultPixelBuffer = pixelBuffer, status == kCVReturnSuccess else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(resultPixelBuffer)
        
        let grayColorSpace = CGColorSpaceCreateDeviceGray()
        guard let context = CGContext(data: pixelData,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(resultPixelBuffer),
                                      space: grayColorSpace,
                                      bitmapInfo: CGImageAlphaInfo.none.rawValue) else {
                                        return nil
        }
        
        context.translateBy(x: 0, y: height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context)
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        return resultPixelBuffer
    }
    
    func resize(to newSize: CGSize) -> UIImage? {
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        defer { UIGraphicsEndImageContext() }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
 
