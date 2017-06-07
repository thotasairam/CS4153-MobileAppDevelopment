//  Sai Ram Thota
//  Weekly Assignment 2
//  CS 4153
//
//  ViewController.swift
//  W02_thota_saiRam
//
//  Created by Sai Ram Thota on 8/23/16.
//  Copyright © 2016 Sai Ram Thota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var total = 0
    var ints = [Int]()
    
    
 
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        total = total + 1
        totalLabel.text = String(total)
        ints.append(1)
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        total = total + 2
        totalLabel.text = String(total)
        ints.append(2)
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        total = total + 3
        totalLabel.text = String(total)
        ints.append(3)
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        total = total + 4
        totalLabel.text = String(total)
        ints.append(4)
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        total = total + 5
        totalLabel.text = String(total)
        ints.append(5)
    }
    
    @IBAction func buttonSix(_ sender: AnyObject) {
        total = total + 6
        totalLabel.text = String(total)
        ints.append(6)
    }
    
    @IBAction func buttonSeven(_ sender: UIButton){
        total = total + 7
        totalLabel.text = String(total)
        ints.append(7)
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        total = total + 8
        totalLabel.text = String(total)
        ints.append(8)
        
    }
    
    @IBAction func buttonNine(_ sender: UIButton) {
        total = total + 9
        totalLabel.text = String(total)
        ints.append(9)
    }
    
    @IBAction func buttonTen(_ sender: UIButton) {
        total = total + 10
        totalLabel.text = String(total)
        ints.append(10)
    }
    
    @IBAction func buttonEleven(_ sender: UIButton){
        total = total + 11
        totalLabel.text = String(total)
        ints.append(11)
    }
    
    @IBAction func buttonTwelve(_ sender: UIButton){
        total = total + 12
        totalLabel.text = String(total)
        ints.append(12)
    }
    
    @IBAction func buttonUndo(_ sender: UIButton) {
        total = total - ints[ints.count - 1]
        totalLabel.text = String(total)
        ints.removeLast()
        
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        total = 0
        totalLabel.text = String(total)
        ints = []
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

