//
//  TaskModel.swift
//  bucket_list_crud
//
//  Created by Minh Pham on 11/17/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation

class TaskModel{
    static func getAllTasks(completionHandler:(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void){
        var url = NSURL(string: "http://localhost:3000/tasks")
        
        let session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    static func addTaskWithObjective(objective:String, completionHandler:(data:NSData?, response:NSURLResponse?, error:NSError?)->Void){
        print("mission received", objective)
        if let urlToReq = NSURL(string: "http://localhost:3000/tasks"){
            let request = NSMutableURLRequest(URL: urlToReq)
            
            request.HTTPMethod = "POST"
            
            let bodyData = "objective=\(objective)"
            print(objective, "line 29")
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            
            print(request)
            let session = NSURLSession.sharedSession()
            
            var task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            
            task.resume()
        }
    }
    
    static func updateTaskWithObjective(index: Int, objective:String, completionHandler:(data:NSData?, response:NSURLResponse?, error:NSError?)->Void){
        print("mission received", objective)
        if let urlToReq = NSURL(string: "http://localhost:3000/tasks/update"){
            let request = NSMutableURLRequest(URL: urlToReq)
            
            request.HTTPMethod = "POST"
            
            let bodyData = "objective=\(index, objective)"
            print(objective, "line 29")
            print(index)
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            
            print(request)
            let session = NSURLSession.sharedSession()
            
            var task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            
            task.resume()
        }
    }
    
    static func deleteTaskWithObjective(objective:String, completionHandler:(data:NSData?, response:NSURLResponse?, error:NSError?)->Void){
        print("mission received", objective)
        if let urlToReq = NSURL(string: "http://localhost:3000/tasks/delete"){
            let request = NSMutableURLRequest(URL: urlToReq)
            
            request.HTTPMethod = "POST"
            
            let bodyData = "objective=\(objective)"
            print(objective, "line 29")
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            
            print(request)
            let session = NSURLSession.sharedSession()
            
            var task = session.dataTaskWithRequest(request, completionHandler: completionHandler)
            
            task.resume()
        }
    }
    
}
