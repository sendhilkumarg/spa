//
//  MealTableViewController.swift
//  spa
//
//  Created by Sendhil kumar Gurunathan on 11/1/15.
//  Copyright © 2015 Sendhil kumar Gurunathan. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals = [Meal]()

    func loadMealsData(){
        let photo1 = UIImage(named: "img1")
        let meal1 = Meal(name: "ABC", photo: photo1 , rating: 2)!
        
        let photo2 = UIImage(named: "img2")
        let meal2 = Meal(name: "SAN", photo: photo2 , rating: 4)!
        
        let photo3 = UIImage(named: "img3")
        let meal3 = Meal(name: "XYZ", photo: photo3 , rating: 5)!
        
        //meals.append(meal1)
        
        
        meals += [meal1,meal2,meal3]

        
    }
    
    func loadMealsFromDisc() ->[Meal]?{
        return  NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    
    func SaveData(){
        print(Meal.ArchiveURL.path!)
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        //loadMealsData()
        
        if let savedMeals = loadMealsFromDisc(){
            meals += savedMeals;
            
        }
        else
        {
            loadMealsData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //This method will be invoked for every cell
         // Table view cells are reused and should be dequeued using a cell identifier.
       let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        let meal = meals[indexPath.row]
        
        cell.lblName.text = meal.name
        cell.imgPhoto.image = meal.photo
        cell.ratingsControl.rating = meal.rating

        return cell
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        
        
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            if  let selectedIndexPath = tableView.indexPathForSelectedRow
            {
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else
            {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            SaveData()
        }
        
        
        
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            meals.removeAtIndex(indexPath.row)
            SaveData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail"){
            print("show  meal.")
            
            var mealViewControler = segue.destinationViewController as! MealViewController
            
            if let selectedTableCell = sender as? MealTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedTableCell)!
                
                let selectedMeal = meals[indexPath.row]
                mealViewControler.meal = selectedMeal
            }
        
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    

}
