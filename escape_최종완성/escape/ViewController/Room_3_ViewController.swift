import UIKit

class Room_3_ViewController: RoomViewController {

    @IBOutlet weak var image_picture: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageRefresh()
    }
    func imageRefresh(){ image_picture.setImage(UIImage(named: "액자(\(ConstMgr.objStates[1])).png", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection), for: UIControl.State.normal)
    }
    @IBAction func BtnTouch(_ sender: ObjButton) {
        switch ConstMgr.objStates[sender.objindex]{
        case 0:
            if ConstMgr.isSafeOpen{ ConstMgr.objStates[sender.objindex] += 1
            }else{ self.performSegue(withIdentifier: "zoomSafe", sender: self)
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
