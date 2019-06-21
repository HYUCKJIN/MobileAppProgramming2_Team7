//
//  SecondSceneViewController.swift
import UIKit

class RoomViewController: UIViewController {
    var inven: InventoryView?
    static var currentRoom: RoomViewController?
    
    override func viewDidLoad() {
        inven = InventoryView()
        inven?.frame = CGRect(x: 0, y: 0, width: 1112, height: 140)
        self.view.addSubview(inven!)
    }
    override func viewWillAppear(_ animated: Bool) {
        GameMgr.instance!.currentInven = inven
        inven?.refresh()
        RoomViewController.currentRoom = self
    }
    @IBAction func Back(_ sender: UIButton) { self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    func CallItemFindView (_ itemIndex: Int) {
        ConstMgr.findItem = itemIndex
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "itemView") as! ItemFindViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    func CallPauseView () {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "menuView") as! MenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }
    func UsingItem(){
        GameMgr.instance!.RemoveItem()
    }
    func showToast(message : String) {
        print(view.frame.size.width)
        let toastLabel = UILabel(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: view.frame.size.width, height: 50))
        toastLabel.text = message
        toastLabel.font = UIFont.systemFont(ofSize: CGFloat(35))
        toastLabel.textAlignment = .center
        toastLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        toastLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7024097711)
        toastLabel.alpha = 0.0
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: { finished in UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }, completion:{(isCompleted) in
            toastLabel.removeFromSuperview()
            })
        })
    }
    
}
