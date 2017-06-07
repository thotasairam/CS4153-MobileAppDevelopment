//
//  AddRollingStockViewController.swift
//  MW02_thota_saiRam
//
//  Created by Sai Ram Thota on 11/13/16.
//  Copyright © 2016 Sai Ram Thota. All rights reserved.
//

import UIKit

class AddRollingStockViewController: UIViewController {

    @IBOutlet weak var roadName: UITextField!

    @IBOutlet weak var number: UITextField!
    
    @IBOutlet weak var datePick: UIDatePicker!

    
    @IBAction func saveBarButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
       
        return true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
