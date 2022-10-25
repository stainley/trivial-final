//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let label = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        bounce(view: label)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.alpha = 0
        label.center.x -= self.view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.label.alpha = 1
            self.label.center.x += self.view.bounds.width
        })
    }
    
    func bounce(view: UIView) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 1.0
        pulse.toValue = 1.12
        pulse.duration = .infinity
        pulse.autoreverses = true
        pulse.initialVelocity = 0.5
        pulse.damping = 0.85
        view.layer.add(pulse, forKey: nil)
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
