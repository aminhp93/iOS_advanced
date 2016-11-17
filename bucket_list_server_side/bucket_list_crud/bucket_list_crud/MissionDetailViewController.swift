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
            mission = newMissionTextField.text!
            delegate?.missionDetailViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
            TaskModel.updateTaskWithObjective(missionToEditIndexPath!, objective: mission, completionHandler: { (data, response, error) in
                print("update success")
            })
        } else {
            let mission = newMissionTextField.text!
            print("mission new", mission)
            delegate?.missionDetailViewController(self, didFinishAddingMission: mission)
            TaskModel.addTaskWithObjective(mission, completionHandler: { (data, response, error) in
                print("add sucess")
            })
        }
    }
}
