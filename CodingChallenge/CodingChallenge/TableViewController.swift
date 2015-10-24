//
//  TableViewController.swift
//  CodingChallenge
//
//  Created by William McDuff on 2015-04-03.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, APIRequestProtocol {

    
    
    lazy var apiRequest : APIRequest = APIRequest(delegate: self)
    
    
    var arrayOfBooksDict =  [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
 
        
       
        
        apiRequest.fetchDataFromUrl()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arrayOfBooksDict.count
    }

    
    func didFinishFetchingData(result: [[String: String]]) {
        
        self.arrayOfBooksDict = result
        println(result)
        
        self.tableView.reloadData()
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
  
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
        
        
      
        
        var bookDict = self.arrayOfBooksDict[indexPath.row] as [String: String]
        
       
        
        if let author =  bookDict["author"]  {
            
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "cell")
            cell!.detailTextLabel!.text = author
            
        }
  
        
        else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default,
                reuseIdentifier: "cell")
        }
   
        
        if let title =  bookDict["title"] {
            cell!.textLabel!.text = title
        }
        
        if let urlString = bookDict["imageURL"]  {
            let url = NSURL(string: urlString)
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            
            
            cell!.imageView!.image = UIImage(data: data!)
        }
        
        
        

        
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
