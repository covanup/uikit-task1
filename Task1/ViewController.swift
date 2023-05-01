import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let squareView = SquareView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(squareView)
        
        squareView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
                squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                squareView.widthAnchor.constraint(equalToConstant: 100),
                squareView.heightAnchor.constraint(equalToConstant: 100),
            ]
        )
    }
}

final class SquareView: UIView {
    private let gradientLayer: CALayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.init(red: 82.0/255.0, green: 155.0/255.0, blue: 200.0/255.0, alpha: 1.0).cgColor,
            UIColor.init(red: 253.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1).cgColor,
            UIColor.init(red: 253.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1).cgColor,
        ]
        gradientLayer.locations = [0.0, 0.45, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 2.5, y: 1.0)
        gradientLayer.cornerRadius = 10.0
        
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.shadowRadius = 5
        gradientLayer.shadowOffset = CGSize(width: 0, height: 10)
        
        return gradientLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
