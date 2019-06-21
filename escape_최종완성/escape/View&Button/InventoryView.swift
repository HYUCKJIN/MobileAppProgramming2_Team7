import UIKit

class InventoryView: UIView {
    private let xibName = "InventoryView"
    
    @IBOutlet var itemBtns: [ItemButton]!
    @IBOutlet weak var timerLB: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    func refresh(){
        for item in itemBtns{
            item.itemCheck()
        }
        if ConstMgr.selectedItem != -1{
            nameLb.text = ConstMgr.NAME[ConstMgr.selectedItem]
        }else{
            nameLb.text = ""
        }
        timerLB.text = ConstMgr.time.timeCalculating()
    }
    @IBAction func Pause(_ sender: UIButton) {
        GameMgr.instance!.OnPause()
    }
}
