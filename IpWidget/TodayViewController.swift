//
//  TodayViewController.swift
//  IpWidget
//
//  Created by  MAC on 15/11/19.
//  Copyright © 2015年 华夏大地教育. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var myIpLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.preferredContentSize = CGSizeMake(320, 64)
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
        
        myIpLabel.text = NSDate().description

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
}
