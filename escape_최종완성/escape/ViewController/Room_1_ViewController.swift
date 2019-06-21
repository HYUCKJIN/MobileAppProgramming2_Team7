import UIKit

class Room_1_ViewController: RoomViewController {
    @IBOutlet weak var imageView_1: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView_1.image = UIImage(named: "view1(\(ConstMgr.objStates[5])).png")
    }
    @IBAction func clickDoor(_ sender: UIButton) {
        if ConstMgr.objStates[5] == 0 {
            self.performSegue(withIdentifier: "zoomDoor", sender: self)
        }
        else if ConstMgr.objStates[5] == 1 {
            ConstMgr.objStates[5] = 2
            imageView_1.image = UIImage(named: "view1(2).png")
        }
        else if ConstMgr.objStates[5] == 2 {
            self.performSegue(withIdentifier: "gameClear", sender: self)
        }
    }
    
}
