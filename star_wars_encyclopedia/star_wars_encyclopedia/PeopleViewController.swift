//
//  ViewController.swift
//  star_wars_encyclopedia
//
//  Created by Minh Pham on 11/15/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://swapi.co/api/people/")
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            print("in here")
//            print(data)
            
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                    print(jsonResult)
                    if let results = jsonResult["results"]{
                        print(results)
                        let resulsArray = results as! NSArray
                        print(resulsArray.count)
                        print(resulsArray.firstObject)
                    }
                }
            } catch {
                print("Something went wrong")
            }
            
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var people = ["Luke SKywalker", "Leia Organa", "Han Solo", "C-3PO", "R2-D2"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        print(indexPath, "____")
        cell.textLabel?.text = people[indexPath.row]
        
        return cell
    }
    
    
}

