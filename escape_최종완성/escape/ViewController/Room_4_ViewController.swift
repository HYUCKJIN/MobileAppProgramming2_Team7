import UIKit

class Room_4_ViewController: RoomViewController {

    @IBOutlet weak var image_wall: UIButton!
    @IBOutlet weak var watchImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        watchRefresh()
        wallRefresh()
    }
    func watchRefresh(){
        var state = 0
        if(ConstMgr.objStates[2] >= 1){
            state = 3
        }else if ConstMgr.objStates[3] == 2{
            state = 2
        }else if ConstMgr.objStates[3] == 1{
            state = 1
        }
        
        watchImage.image = UIImage(named: "괘종시계(\(state)).png", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection)
    }
    func wallRefresh(){ image_wall.setImage(UIImage(named: "벽돌(\(ConstMgr.objStates[4])).png", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection), for: UIControl.State.normal)
    }
}
