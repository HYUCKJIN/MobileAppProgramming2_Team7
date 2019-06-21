import UIKit

class MainViewController: UIViewController {
    var gameMgr = GameMgr()
    
    @IBAction func GameStart(_ sender: Any) {
        GameMgr.instance!.GameStart()
    }
    @IBAction func NewGameStart(_ sender: Any) {
        GameMgr.instance!.resetData()
        GameMgr.instance!.GameStart()
    }
}
