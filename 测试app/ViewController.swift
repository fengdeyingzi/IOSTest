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
    @IBOutlet weak var textView1: UITextField!
    @IBOutlet weak var textView2: UITextField!
    @IBOutlet weak var textView3: UITextField!
    @IBAction func btn_dowm(_ sender: UIButton) {
        sender.setTitle("按钮点击：\(check_num!)", for: UIControl.State.normal)
        check_num!+=1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_num = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        NSLog("btn tag is %d", sender.tag)
        textView1.text = "tag = \(sender.tag)";
        gotoActivity()
        
    }
    
    //跳转界面
    func gotoActivity(){
        let vr = ToViewController(nibName: "ToViewController", bundle: nil)
        self.navigationController?.popToViewController(vr, animated: true)
        
        //vc.labelContent = input.text
        //self.presentModalViewController(vr, animated: true);
        
    }
    
}

