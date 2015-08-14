//
//  TableViewController.swift
//  CoreList
//
//  Created by William McDuff on 2015-02-24.
//  Copyright (c) 2015 William McDuff. All rights reserved.

// Labwork: 

// - make the cell show the created date
// - change color of cell background based on time since creation [green, yellow, red]
// -  add fetch predicate & sortdescriptor to order based on creation date ... oldest first
// - make background grey and text white if completed
// - tap cell to toggle completed

// Bonus:

// fetch with a predicate and then put in two arrays for 1 section and for another section
// - create 2 sections [non-completed, completed]


import UIKit 
import CoreData

class TableViewController: UITableViewController {

    var items: [AnyObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func viewWillAppear(animated: Bool) {
        // fetch from core data & reload table view
        
        let applicationDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let entity = NSEntityDescription.entityForName("Items", inManagedObjectContext: applicationDelegate.managedObjectContext!)
        
        let fetch = NSFetchRequest()
        fetch.entity = entity
        
        
        if let results = applicationDelegate.managedObjectContext?.executeFetchRequest(fetch, error: nil) {
            
            items = results
            tableView.reloadData()
            
        }
        
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
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        let object = items[indexPath.row] as NSManagedObject
        
        cell.textLabel?.text = object.valueForKey("name") as? String
        
        println(items[indexPath.row])
        return cell
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
