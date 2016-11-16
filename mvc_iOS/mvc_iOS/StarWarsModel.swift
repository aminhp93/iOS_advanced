//
//  StarWarsModel.swift
//  mvc_iOS
//
//  Created by Minh Pham on 11/16/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation

class StarWarsModel{
    static func getAllPeople(completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void){
        let url = NSURL(string: "http://swapi.co/api/people/")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func getAllFilms(completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void){
        let url = NSURL(string: "http://swapi.co/api/films/")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: completionHandler)
        task.resume()
    }
    
}
