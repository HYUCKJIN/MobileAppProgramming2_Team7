import UIKit

class Room_1_1_ViewController: RoomViewController {
    @IBOutlet weak var imageView_1_1: UIImageView!
    
    @IBAction func Button_1_1(_ sender: UIButton) {
        if ConstMgr.selectedItem == 4 {
            imageView_1_1.image = UIImage(named: "view1-1(1).png")
            ConstMgr.objStates[5] = 1
            UsingItem()
        }
        else if ConstMgr.selectedItem == 0 {
            self.showToast(message: ConstMgr.MESSAGE[0])
        }
        else {
            self.showToast(message: ConstMgr.MESSAGE[1])
        }
    }
}
