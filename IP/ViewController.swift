//
//  ViewController.swift
//  IP
//
//  Created by  MAC on 15/11/18.
//  Copyright © 2015年 华夏大地教育. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    let myIpUrl = "http://ip.taobao.com/service/getIpInfo2.php?ip=myip"
    var request: Alamofire.Request?
    
    @IBOutlet weak var myIpLabel: UILabel!
    
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.requestMyIpInfo()
        
    }
    
    func requestMyIpInfo() {
        
        request?.cancel()
        
        self.myIpLabel.text = "N/A"
        self.myActivityIndicatorView.startAnimating()
        
        request = Alamofire.request(.GET, myIpUrl).responseJSON{ response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                if let data = JSON["data"] as? NSDictionary
                {
                    let ip = data["ip"]
                    print("my ip is : \(ip)")
                    
                    self.myIpLabel.text = ip as? String
                }
                
                self.myActivityIndicatorView.stopAnimating()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshButtonPressed(sender: UIButton) {
        
        self.requestMyIpInfo()
        
    }

}

