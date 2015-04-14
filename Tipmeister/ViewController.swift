//
//  ViewController.swift
//  Tipmeister
//
//  Created by Rob Innes Hislop on 4/12/15.
//  Copyright (c) 2015 Rob Innes Hislop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!

    @IBOutlet weak var TipSegControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEditChanged(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        var tipPercent = tipPercentages[TipSegControl.selectedSegmentIndex]
        var billAmount = BillField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercent
        
        TipLabel.text = String(format: "$%.2f", tip )
        TotalLabel.text = String(format: "$%.2f", tip + billAmount)

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("default_tip_percentage_index")
        TipSegControl.selectedSegmentIndex = defaultIndex
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
}

