//
//  ViewController.swift
//  tip calc 2
//
//  Created by Steve Kim on 9/25/16.
//  Copyright © 2016 Steve Kim. All rights reserved.
//

import UIKit
extension Float {
    var cleanValue: String {
        return self % 1 == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
   
    @IBOutlet weak var exclamationPhrases: UILabel!
    @IBOutlet weak var personIcon1: UIImageView!
    @IBOutlet weak var personIcon2: UIImageView!
    @IBOutlet weak var personIcon3: UIImageView!
    @IBOutlet weak var perosnIcon4: UIImageView!
    @IBOutlet weak var splitBill: UITextField!
    
    @IBOutlet weak var thetipsplitLabel: UILabel!
    @IBOutlet weak var splittedTip: UILabel!
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
       
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let stringf = defaults.stringForKey(SettingsViewController.key){
            tipPercentage.text = stringf
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
           var tip_percentages = [0.18,0.2,0.22,0.3]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let stringf = defaults.stringForKey(SettingsViewController.key){
            tip_percentages[3] = Double((Float(stringf)!/100).cleanValue)!
        }
    
        let bill = Double(billField.text!) ?? 0
        let tip =  bill * tip_percentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipPercentage.text = (String((Float(tip_percentages[tipControl.selectedSegmentIndex])*100).cleanValue))+"%"
        billLabel.text = "$\(bill)"
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        if tipControl.selectedSegmentIndex == 0{
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 1.0
            })
            exclamationPhrases.text = "Nice!"
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 0
            })
        }
        else if tipControl.selectedSegmentIndex == 1{
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 1.0
            })
            exclamationPhrases.text = "Wow!"
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 0
            })
        }
        else if tipControl.selectedSegmentIndex == 2{
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 1.0
            })
            exclamationPhrases.text = "Good Job!"
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 0
            })
        }
        else if tipControl.selectedSegmentIndex == 3{
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 1.0
            })
            exclamationPhrases.text = "Sugoi Senpai!!"
            UIView.animateWithDuration(0.5, animations:{ self.exclamationPhrases.alpha = 0
            })
        }
    }
    
    @IBAction func splitBill(sender: AnyObject) {
        var tip_percentages = [0.18,0.2,0.22,0.3]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let stringf = defaults.stringForKey(SettingsViewController.key){
            tip_percentages[3] = Double((Float(stringf)!/100).cleanValue)!
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip =  bill * tip_percentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        UIView.animateWithDuration(0.5, animations:{ self.thetipsplitLabel.alpha = 1.0
        })
        UIView.animateWithDuration(0.5, animations:{ self.splittedTip.alpha = 1.0
        })
        splittedTip.text! = "$\(String(total / Double(splitBill.text!)!))"
        if splitBill.text! == "2"{
            UIView.animateWithDuration(0.5, animations:{ self.personIcon1.alpha = 1.0
    })
            UIView.animateWithDuration(0.5, animations:{ self.personIcon2.alpha = 1.0
            })
    }
        if splitBill.text! == "3"{
            UIView.animateWithDuration(0.5, animations:{ self.personIcon1.alpha = 1.0
            })
            UIView.animateWithDuration(0.5, animations:{ self.personIcon2.alpha = 1.0
            })
            UIView.animateWithDuration(0.5, animations:{ self.personIcon3.alpha = 1.0
            })
        }
        if splitBill.text! == "4"{
            UIView.animateWithDuration(0.5, animations:{ self.personIcon1.alpha = 1.0
            })
            UIView.animateWithDuration(0.5, animations:{ self.personIcon2.alpha = 1.0
            })
            UIView.animateWithDuration(0.5, animations:{ self.personIcon3.alpha = 1.0
            })
            UIView.animateWithDuration(0.5, animations:{ self.perosnIcon4.alpha = 1.0
            })
        }
}
}
