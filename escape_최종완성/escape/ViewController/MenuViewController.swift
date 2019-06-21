import UIKit

class MenuViewController: UIViewController {

    @IBAction func Back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        GameMgr.instance!.OnPuaseEnd()
    }
    
    @IBAction func ReturnToMain(_ sender: UIButton) { self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        GameMgr.instance!.DataSave()
    }
}
@IBDesignable extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
