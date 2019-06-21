import UIKit

@IBDesignable
class ItemButton: UIButton {
    @IBInspectable
    var slotIdx : Int = 0
    @IBInspectable
    var itemIdx : Int = -1{
        didSet{
            setNeedsLayout()
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        itemCheck()
    }
    func itemCheck(){
        if ConstMgr.inven.count > slotIdx {
            itemIdx = ConstMgr.inven[slotIdx]
            self.setImage(UIImage(named: "item(\(itemIdx)).png", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection), for: UIControl.State.normal)
        }else{
            itemIdx = -1
            self.setImage(nil, for: .normal)
        }
        if(slotIdx == ConstMgr.selectedSlot){
            self.backgroundColor = UIColor.gray
        }else{
            self.backgroundColor = UIColor.white
        }
        setNeedsLayout()
        setNeedsDisplay()
    }
    @objc func itemSelected(){
        if(ConstMgr.inven.count > slotIdx && ConstMgr.selectedSlot != slotIdx){
            ConstMgr.selectedSlot = slotIdx
        }else{
            ConstMgr.selectedSlot = -1
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        itemSelected()
    }
}
