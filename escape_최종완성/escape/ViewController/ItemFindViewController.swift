import UIKit

class ItemFindViewController: UIViewController {

    @IBOutlet weak var itemimage: UIImageView!
    @IBOutlet weak var explain: UILabel!
    
    @IBAction func Back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
        GameMgr.instance!.GetItem()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemimage.image = UIImage(named: "item(\(ConstMgr.findItem)).png")
        explain.text = ConstMgr.NAME[ConstMgr.findItem]
    }
}
