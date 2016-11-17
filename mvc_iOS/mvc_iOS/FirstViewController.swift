//
//  FirstViewController.swift
//  mvc_iOS
//
//  Created by Minh Pham on 11/16/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController, CancelButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        StarWarsModel.getAllPeople { (data, response, error) in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        
                        for i in resultsArray{

                            self.people.append(i["name"] as! String)
                            
//                            print(i, "line 27")

                            if (i["gender"] as! String == "n/a"){
                                self.gender.append("Not defined Gender")
                            } else {
                                self.gender.append(i["gender"] as! String)
                            }
                            
                            if (i["birth_year"] as! String == "unknown"){
                                self.birth.append("Not defined Birth Year")
                            } else {
                                self.birth.append(i["birth_year"] as! String)
                            }
                            
                            if (i["mass"] as! String == "n/a"){
                                self.mass.append("Not defined Mass")
                            } else {
                                self.mass.append(i["mass"] as! String)
                            }
                            
                            // call species http://swapi.co/api/species/2/
                            print(i["species"] as! [String], "line 48")
                            var specie = i["species"] as! [String]
                            
                            var url = NSURL(string: specie[0])
                            let session = NSURLSession.sharedSession()
                        
                            var task = session.dataTaskWithURL(url!) { (data, response, error) in
                                
                                do {
                                    if var jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                                        print(jsonResult["classification"], "line 58")
                                        self.species.append(jsonResult["classification"] as! String)
                                    }
                                } catch {
                                    print("Something went wrong")
                                }
                            }
                            task.resume()
                        }

                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                        })
                    }
                }
            } catch {
                print("Some thing wrong")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var people = [String]()
    var gender = [String]()
    var birth = [String]()
    var mass = [String]()
    var species = [String]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = people[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        print("hello")
        performSegueWithIdentifier("view", sender: tableView.cellForRowAtIndexPath(indexPath))
        //print(indexPath)
        //print(indexPath.row, "++++++++++++")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! PeopleDetailController
        print(species)
        controller.cancelButton = self
        if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
            print(people[indexPath.row])
            controller.name = people[indexPath.row]
            controller.gender = gender[indexPath.row]
            controller.birthday = birth[indexPath.row]
            print(controller.birthday)
            controller.mass = mass[indexPath.row]
            controller.species = species[indexPath.row]
            
            
        }
    }
    
    func cancelButtonDelegate(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

