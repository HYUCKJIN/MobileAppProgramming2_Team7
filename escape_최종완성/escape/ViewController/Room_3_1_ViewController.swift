import UIKit

class Room_3_1_ViewController: RoomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnTouch(_ sender: ObjButton) {
        switch ConstMgr.objStates[sender.objindex]{
        case 0: ConstMgr.objStates[sender.objindex] += 1
        case 1:
            CallItemFindView(sender.itemindex)
        ConstMgr.objStates[sender.objindex] += 1
        default: break
        }
        sender.setNeedsLayout()
        sender.setNeedsDisplay()
    }
    @IBAction func pirtureTouch(_ sender: UIButton) {
        showToast(message: ConstMgr.MESSAGE[10])
    }
}
