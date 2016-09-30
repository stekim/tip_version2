//
//  SettingsViewController.swift
//  tip calc 2
//
//  Created by Steve Kim on 9/28/16.
//  Copyright © 2016 Steve Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var newTip: UITextField!
    
    static let key = "key"
    static let key2 = "key2"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func saveTip(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(newTip.text, forKey: SettingsViewController.key)
        defaults.setInteger(123, forKey: SettingsViewController.key2)
        defaults.synchronize()
    }

    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let stringf = defaults.stringForKey(SettingsViewController.key){
            print(stringf)
        }
        if let intf = defaults.stringForKey(SettingsViewController.key2){
            print(intf)
        }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    

}
