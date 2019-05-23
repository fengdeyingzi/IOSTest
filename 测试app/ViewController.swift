//
//  ViewController.swift
//  测试app
//
//  Created by xlapp on 2019/5/15.
//  Copyright © 2019 xlapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var check_num:Int?;
    @IBAction func btn_dowm(_ sender: UIButton) {
        sender.setTitle("按钮点击：\(check_num!)", for: UIControl.State.normal)
        check_num!+=1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_num = 0
        // Do any additional setup after loading the view, typically from a nib.
    }


}

