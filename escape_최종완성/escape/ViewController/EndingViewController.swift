//
//  EndingViewController.swift
//  escape
//
//  Created by 2013105107 on 19/06/2019.
//  Copyright © 2019 COMP420. All rights reserved.
//

import UIKit

class EndingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var clearTime: UILabel! // 00:00:00
    
    @IBOutlet weak var InputName: UITextField! // 텍스트 입력 창
    
    @IBOutlet weak var testLabel: UILabel! // 텍스트창에 입력된 문자열 출력 테스트
    
    @IBOutlet weak var btn_gotoMenu: UIButton! // 시작화면 돌아가기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_gotoMenu.isHidden = true
        
        InputName.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        InputName.text = "이름을 입력해주세요"
        clearTime.text = ConstMgr.time.timeCalculating()
        GameMgr.instance?.GameEnd()
    }
    //키보드가 올라오면 실행할 동작 처리
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //키보드가 내려가면 실행할 동작 처리
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    //입력이 시작되면 실행할 동작 처리
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    //입력을 완료하면 실행할 동작 처리
    func textFieldDidEndEditing(_ textField: UITextField) {
        testLabel.text = textField.text
        btn_gotoMenu.isHidden = false
    }
    @IBAction func ReturnToMain(_ sender: UIButton) { self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        ConstMgr.userData.append(UserData(testLabel.text!,ConstMgr.time))
        GameMgr.instance!.resetData()
        GameMgr.instance!.DataSave()
    }
}
