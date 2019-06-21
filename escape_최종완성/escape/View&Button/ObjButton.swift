import UIKit

@IBDesignable
class ObjButton: UIButton {
    
    
    @IBInspectable
    //0 : 금고, 1 : 액자, 2 : 시계 상, 3 : 시계 하, 4 : 벽돌
    var objindex : Int = 0{
        didSet{
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    @IBInspectable
    //0 : 확대상태, 1 : 아이템 있는 상태, 2 : 아이템 없는 상태
    var objState: Int = 0{
        didSet{
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    //0 : 시계열쇠, 1 : 망치, 2 : 시계추, 3 : 드라이버, 4 : 탈출열쇠
    @IBInspectable
    var itemindex: Int = 0{
        didSet{
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        objState = ConstMgr.objStates[objindex]
        self.setImage(UIImage(named: "obj\(objindex)(\(objState)).png", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection), for: UIControl.State.normal)
    }
    
    
    
}
