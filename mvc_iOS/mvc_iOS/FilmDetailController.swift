//
//  FilmDetailController.swift
//  mvc_iOS
//
//  Created by Minh Pham on 11/16/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class FilmDetailController:UIViewController{
    var cancelButton: CancelButtonDelegate?
    
    var title_name:String?
    var release_date:String?
    var director:String?
    var opening_crawl:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(release_date)
        titleLabel.text = title_name
        releaseLabel.text = release_date
        directorLabel.text = director
        openingCrawLabel.text = opening_crawl
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    @IBOutlet weak var openingCrawLabel: UILabel!
    
    @IBAction func cancelButton(sender: AnyObject) {
        cancelButton?.cancelButtonDelegate(self)
    }
    
    
    
}
