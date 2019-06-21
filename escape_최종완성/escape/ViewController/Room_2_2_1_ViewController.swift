//
//  Room_2_2_1_ViewController.swift
//  escape
//
//  Created by 2013105107 on 19/06/2019.
//  Copyright © 2019 COMP420. All rights reserved.
//

import UIKit

class Room_2_2_1_ViewController: RoomViewController {
    @IBAction func btn_memo(_ sender: UIButton) {
        showToast(message: ConstMgr.MESSAGE[4])
    }
}
