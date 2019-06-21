import UIKit

class Room_3_2_ViewController: RoomViewController {
    
    @IBOutlet var passwords: [UILabel]!
    
    @IBOutlet var btn_password: [UIButton]!
    
    @IBAction func btn_1A(_ sender: UIButton) {
        switch btn_password.index(of: sender)! {
        case 0: passwords[0].text = changeNum(passwords[0].text!, 1)
        case 1: passwords[0].text = changeNum(passwords[0].text!, 0)
        case 2: passwords[1].text = changeNum(passwords[1].text!, 1)
        case 3: passwords[1].text = changeNum(passwords[1].text!, 0)
        case 4: passwords[2].text = changeNum(passwords[2].text!, 1)
        case 5: passwords[2].text = changeNum(passwords[2].text!, 0)
        default: break
        }
        collectPassword()
    }
    func collectPassword() {
        if passwords[0].text == "5" &&
            passwords[1].text == "5" &&
            passwords[2].text == "5" {
            for i in 0..<6 {
                btn_password[i].isHidden = true
            }
            for pw in passwords{
                pw.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            }
            ConstMgr.isSafeOpen = true
            showToast(message: ConstMgr.MESSAGE[5])
        }
    }
    func changeNum(_ numStr: String, _ flagBit: Int ) -> String{
        let nIntVal:UInt? = UInt(numStr)
        let resultNum: UInt
        
        if flagBit == 0 {
            if nIntVal == 0 {
                return "9"
            }
            else {
                resultNum = nIntVal! - 1
                return String(resultNum)
            }
        } else {
            if nIntVal == 9 {
                return "0"
            }
            else {
                resultNum = nIntVal! + 1
                return String(resultNum)
            }
        }
    }
    
}
