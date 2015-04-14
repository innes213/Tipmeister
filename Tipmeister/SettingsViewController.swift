//
//  SettingsViewController.swift
//  Tipmeister
//
//  Created by Rob Hislop on 4/13/15.
//  Copyright (c) 2015 Rob Innes Hislop. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultTipController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DefaultTipChanged(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(DefaultTipController.selectedSegmentIndex, forKey: "default_tip_percentage_index")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("default_tip_percentage_index")
        DefaultTipController.selectedSegmentIndex = defaultIndex
    }

}
