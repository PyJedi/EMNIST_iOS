import UIKit
import PlaygroundSupport

let viewController = PredViewController()
viewController.preferredContentSize = CGSize(width: 600, height: 800)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = UINavigationController(rootViewController: viewController)
