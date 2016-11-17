//
//  SecondViewController.swift
//  mvc_iOS
//
//  Created by Minh Pham on 11/16/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController, CancelButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        StarWarsModel.getAllFilms { (data, response, error) in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        
                        for i in resultsArray{
                            self.films.append(i["title"] as! String)
                            self.release_date.append(i["release_date"] as! String)
                            self.director.append(i["director"] as! String)
                            self.opening_crawl.append(i["opening_crawl"] as! String)

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
    
    var films = [String]()
    var release_date = [String]()
    var director = [String]()
    var opening_crawl = [String]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        //        print(indexPath, "____")
        let cell = tableView.dequeueReusableCellWithIdentifier("filmCell")!
        cell.textLabel?.text = films[indexPath.row]
        
        return cell
    }

    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("viewFilm", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    func cancelButtonDelegate(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! FilmDetailController
        controller.cancelButton = self
        
        if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
            controller.title_name = films[indexPath.row]
            controller.release_date = release_date[indexPath.row]
            controller.director = director[indexPath.row]
            controller.opening_crawl = opening_crawl[indexPath.row]
        }
        
    }
}

