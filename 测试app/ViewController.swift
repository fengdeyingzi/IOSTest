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
    
    @IBOutlet weak var text_input: UITextField!
    @IBOutlet weak var text_output: UITextView!
    
    //点击按钮翻译
    @IBAction func btn_fanyi(_ sender: UIButton) {
        //获取输入文本
        let text = text_input.text;
        fanyi(text!)
    }
    
    
    @IBAction func btn_dowm(_ sender: UIButton) {
        sender.setTitle("按钮点击：\(check_num!)", for: UIControl.State.normal)
        check_num!+=1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_num = 0
        print("ViewDidLoad")
        print("View".md5())
        let gettest = HttpTest()
//        fanyi("test")
        //gettest.post("https://yzjlb.net/", "param");
//        var lis = listener();
        /*gettest.postUrl("https://yzjlb.net/", withParam: "param"){(str) in
            NSLog("获取成功 --> %@",str!)
        };*/
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
    
    /*
    func postTest()->Void{
        let url = NSURL(string: "https://yzjlb.net")
        var req = NSMutableURLRequest(url: url as! URL);
        
        req.httpMethod = "POST";
       req.HTTPBody = NSData(data: Data(base64Encoded: "jhg"))
        let request = NSMutableURLRequest(url: url as! URL)
        request.httpMethod = "POST";
        let args:NSString = NSString("action=test")
        //request.httpBody = args;
        let session = URLSession.shared
        session.dataTask(with: url, completionHandler: (data,url,handler){
            
        });
        let task: URLSessionDataTask = session.dataTask(with: (data,request,error)->{
            
        }){
            (data,response,error) in
            if error == null{
                do{
                    if let dict = try JSONSerialization.jsonObject(with: data, options: ""){
                        
                    }
                }
            }
        }
     
    }
    
    
    func post2()->Void{
        let url : NSURL = NSURL(string: "https://yzjlb.net")!
        
        //创建请求对象
        let request : NSURLRequest = NSURLRequest(url: url as URL)
        
        //获取会话对象
        let session: URLSession = URLSession.shared
        
        //创建一个task发送请求
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error == nil {
                do{
                    
                    //对收到的数据进行json进行解析
                    if let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)as? NSDictionary{
                        
                        let result = dict.object(forKey: "IMEISetFlag") as! String
                        /*
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            if result == "1" {
                                
                                //返回访问成功，执行成功之后的操作
                            }
                        })
 */
                        
                    }
                    
                }catch{
                    print("错误")
                }
            }
            
        }
        //执行任务
        task.resume()
    }
    
    */
    
    //有道翻译
    func fanyi(_ text:String) -> Void {
        let now = NSDate();
        let ii = arc4random()%10 + 1;
        let time = (Int)(now.timeIntervalSince1970 * 1000)
        print("时间\(time)")
        let ua = "Dalvik/1.6.0 (Linux;Android 4.4.4; MI 4LTE MIUI/V6.2.0.KXDCNCF";
        let textcode:String = text;
        let d = "@6f#X3=cCuncYssPsuRUE";
        var param = "i=" + textcode
            param += "&from=AUTO"
            param +=  "&smartresult=dict"
            param +=  "&client=fanyideskweb"
            param +=  "&salt=\(time)\(ii)"
            param +=  "&sign="
            param +=  ("fanyideskweb\(text)\(time)\(ii)\(d)").md5()
            param +=  ("&ts=\(time)")
            param +=  ("&bv=" + ua.md5())
            param +=  "&doctype=json"
            param +=  "&version=2.1"
            param +=  "&keyfrom=fanyi.web"
            param +=  "&action=FY_BY_CLICKBUTTION"
            param +=  "&typoResult=false"
        let url = "http://fanyi.youdao.com/translate_o?smartresult=dict&smartresult=rule";
        print("参数：\(param)")
        let post = HttpTest();
        post.postFanyi(url, withParam: param) {(str) in
            print("\(str!)")
           /*
            OperationQueue .main.addOperation(black: {
                text_output.text = str!
                })
            };
        */
        DispatchQueue.main.sync {
            self.text_output.text = str!
            self.text_output.text = "";
            let data = str!.data(using: String.Encoding.utf8)
            
          //  let jsonData = JSONSerialization.JSONObjectWithData(Data, options: JSONSerialization.ReadingOptions.MutableContainers, error: nil) as NSDictionary
            let json = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
          //  var str="result:\n"+String(ExternString!)
            let array1:NSArray = json?.object(forKey: "translateResult") as! NSArray
            for i in 0..<array1.count{
                let array2 = array1.object(at: i) as! NSArray
                for ii in 0..<array2.count{
                    let obj = array2.object(at: ii) as! NSDictionary
                    let tgt = obj.object(forKey: "tgt") as! String
                    let src = obj.object(forKey: "src") as! String
                    print("tgt=\(tgt) src= \(src)")
                    self.text_output.text.append(tgt+"\n")
                }
            }
          
            
            for (key,value) in json ?? ["":""]{
                print("\n key-->\(key)"+" value=\(value) ")
                
            }
        }
        
        
//        var ii = arc4random()%10 + 1;
        
    }
}
}
