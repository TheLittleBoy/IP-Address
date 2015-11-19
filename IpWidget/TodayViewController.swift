//
//  TodayViewController.swift
//  IpWidget
//
//  Created by  MAC on 15/11/19.
//  Copyright © 2015年 华夏大地教育. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    
    let myIpUrl = "http://ip.taobao.com/service/getIpInfo2.php?ip=myip"
    var request: Alamofire.Request?
    
    @IBOutlet weak var myIpLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.preferredContentSize = CGSizeMake(320, 64)
        
        self.requestMyIpInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        
        /* 默认返回值 UIEdgeInsets
        - top : 0.0
        - left : 48.0
        - bottom : 39.0
        - right : 0.0 { ... }
        */
        return UIEdgeInsetsZero
        
    }
    
    @IBAction func ipLableTapAction(sender: AnyObject) {
        
        self.extensionContext?.openURL(NSURL(string: "edu-edu.myip://")!, completionHandler: { (Bool) -> Void in
            //
        })
        
    }
    
    func requestMyIpInfo() {
        
        request?.cancel()
        
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

}
