//
//  PeopleDetailController.swift
//  mvc_iOS
//
//  Created by Minh Pham on 11/16/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class PeopleDetailController: UIViewController{
    
    var cancelButton: CancelButtonDelegate?
    
    var name:String?
    var gender:String?
    var birthday:String?
    var mass:String?
    var species:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        genderLabel.text = gender
        birthdayLabel.text = birthday
        massLabel.text = mass
        specieLabel.text = species
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var specieLabel: UILabel!
    
    @IBAction func cancelButton(sender: AnyObject) {
        cancelButton?.cancelButtonDelegate(self)
    }
}


