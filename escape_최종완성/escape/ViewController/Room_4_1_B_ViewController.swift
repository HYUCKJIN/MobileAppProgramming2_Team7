import UIKit

class Room_4_1_B_ViewController: RoomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func BtnTouch(_ sender: ObjButton) {
        switch ConstMgr.objStates[sender.objindex]{
        case 0:
            if ConstMgr.selectedItem == 0{
                ConstMgr.objStates[sender.objindex] += 1
                UsingItem()
            }else if ConstMgr.selectedItem == -1{//아이템 선택 안 되었을 때
                showToast(message: ConstMgr.MESSAGE[7])
            }else {//선택은 되었지만 맞지 않을 때
                showToast(message: GameMgr.instance!.Mis_MSG())
            }
        case 1:
            CallItemFindView(sender.itemindex)
            ConstMgr.objStates[sender.objindex] += 1
        default: break
        }
        sender.setNeedsLayout()
        sender.setNeedsDisplay()
    }
}
