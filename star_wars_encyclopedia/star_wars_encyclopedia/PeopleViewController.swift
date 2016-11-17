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
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            
            
        var count = 0
        var url = NSURL(string: "http://swapi.co/api/people/")
        let session = NSURLSession.sharedSession()
            
//        while(count < 10){
//            count += 1

    
        var task = session.dataTaskWithURL(url!) { (data, response, error) in
            
            do {
                if var jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"]{
                        let resulsArray = results as! NSArray
                        for i in resulsArray{
                            self.people.append(i["name"] as! String)
                        }
                        dispatch_async(dispatch_get_main_queue()){
                            self.tableView.reloadData()
                        }

                    }
//                        url = NSURL(string: jsonResult["next"] as! String)
//                        print(url)
                    
                }
            } catch {
                print("Something went wrong")
            }
            
        }
        task.resume()
//            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var people = ["Luke SKywalker", "Leia Organa", "Han Solo", "C-3PO", "R2-D2"]
    var people = [String]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        print(indexPath, "____")
        cell.textLabel?.text = people[indexPath.row]
        
        return cell
    }
    
    
}

