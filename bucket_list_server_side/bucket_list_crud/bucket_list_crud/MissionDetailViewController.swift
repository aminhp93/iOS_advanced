//
//  MissionDetailViewController.swift
//  bucket_list_crud
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class MissionDetailViewController: UITableViewController{
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var delegate: MissionDetailViewControllerDelegate?
    var missionToEdit: String?
    var missionToEditIndexPath: Int?
    
    override func viewDidLoad() {
        if missionToEdit != nil {
            newMissionTextField.text =  missionToEdit!
        }
    }
    
    @IBOutlet weak var newMissionTextField: UITextField!
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        if var mission = missionToEdit{
            print("missionDetail edit")
            mission = newMissionTextField.text!
            print(missionToEdit!)
//            print(mission)
            delegate?.missionDetailViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
        } else {
            let mission = newMissionTextField.text!
            delegate?.missionDetailViewController(self, didFinishAddingMission: mission)
        }
    }
}
