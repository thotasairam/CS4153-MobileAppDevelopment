//
//  RollingStockTableViewController.swift
//  MW02_thota_saiRam
//
//  Created by Sai Ram Thota on 11/13/16.
//  Copyright © 2016 Sai Ram Thota. All rights reserved.
//

import UIKit
import Foundation

class RollingStockTableViewController: UITableViewController {
    
    let dbUsername: String = "tsairam"
    let dbPassword: String = "Oe583eu"
    
    var rollingStock :[(String,String)] = [(eng: "test1", m: "test"), (eng:"test2", m:"test"), (eng:"test3", m:"test")]
    
    var values: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as? UITableView{
            view.contentInset.top = 20
            view.scrollIndicatorInsets.top = 20
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.hidesBackButton = true
        
        getData()
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rollingStock.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RollingStockCell", for: indexPath)
        
        //Get the data for this cell from array
        
        let cellData: (eng: String, m: String) = rollingStock[indexPath[1]]
        
        // Configure the cell...
        cell.textLabel?.text = cellData.eng
        cell.detailTextLabel?.text = cellData.m
        
        //AddDeletion method (swipe left and delete)
        
        

        return cell
    }
    
    //MARK:- REST and JSON
    
    func getData()
    {
        //Usage for get:- protocol://server/GET/host/user/pass/
        let url = URL(string: "https://cs.okstate.edu/~tsairam/cs4153_mw02.php/GET/\(dbUsername)/\(dbPassword)")!
        
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url){ (data,response,error) in
            
            guard error == nil else {
                print("Error in session call: \(error)")
                return
            }
            
            guard let result = data else{
                print("No data received")
                return
            }
            
            do{
                
                var json : NSDictionary!
                
                json = try JSONSerialization.jsonObject(with: result, options: .allowFragments) as! NSDictionary
                if let myData = json["res"] as? NSArray{
                    print("\(json)")
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
