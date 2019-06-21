import UIKit

class Room_4_2_ViewController: RoomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func BtnTouch(_ sender: ObjButton) {
        switch ConstMgr.objStates[sender.objindex]{
        case 0:
            if ConstMgr.selectedItem == 1{
                ConstMgr.objStates[sender.objindex] += 1
                UsingItem()
            }else if ConstMgr.selectedItem == -1{//아이템 선택 안 되었을 때
                showToast(message: ConstMgr.MESSAGE[8])
            }else {//선택은 되었지만 맞지 않을 때
                showToast(message: GameMgr.instance!.Mis_MSG())
            }
        case 1:
            if ConstMgr.selectedItem == 2{
                ConstMgr.objStates[sender.objindex] += 1
                UsingItem()
                CallItemFindView(sender.itemindex)
            }else if ConstMgr.selectedItem == -1{//아이템 선택 안 되었을 때
                showToast(message: ConstMgr.MESSAGE[9])
            }else {//선택은 되었지만 맞지 않을 때
                showToast(message: GameMgr.instance!.Mis_MSG())
            }
        default: break
        }
        sender.setNeedsLayout()
        sender.setNeedsDisplay()
    }
}
