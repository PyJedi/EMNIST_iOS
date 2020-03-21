import UIKit
import PlaygroundSupport

public class IntroViewController: UIViewController {

    public lazy var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 267, y: 667, width: 67, height: 67)
        button.setImage(UIImage(named: "button"), for: .normal)
        button.addTarget(self, action: #selector(nextbuttontapped(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func nextbuttontapped(_ sender: UIButton){
        let nextview = PredViewController()
        navigationController?.pushViewController(nextview, animated: true)
    }
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
        view.backgroundColor = .white
        let maingrad = CAGradientLayer()
        maingrad.frame = view.bounds
        maingrad.colors = [UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1).cgColor, UIColor(red: 0.63, green: 0.66, blue: 0.91, alpha: 1).cgColor]
        self.view = view
        navigationController?.isNavigationBarHidden = true
        view.layer.addSublayer(maingrad)
        view.alpha = 1

        let circle = UIView()
        circle.frame = CGRect(x: 267, y: 667, width: 67, height: 67)
        circle.clipsToBounds = true
        circle.layer.cornerRadius = 67/2
        circle.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        circle.alpha = 1
        
        let viewShadow = UIView(frame: CGRect(x: 267, y: 667, width: 67, height: 67))
        viewShadow.center = circle.center
        viewShadow.backgroundColor = UIColor.black
        viewShadow.layer.cornerRadius = 67/2
        viewShadow.layer.shadowColor = UIColor.darkGray.cgColor
        viewShadow.layer.shadowOpacity = 0.5
        viewShadow.layer.shadowOffset = CGSize.zero
        viewShadow.layer.shadowRadius = 20
        view.addSubview(viewShadow)

        view.addSubview(circle)
        view.addSubview(button)
    }
    
}
