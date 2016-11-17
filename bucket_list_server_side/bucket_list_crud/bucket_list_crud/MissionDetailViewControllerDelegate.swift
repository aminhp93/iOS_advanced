//
//  MissionDetailViewControllerDelegate.swift
//  bucket_list_crud
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation

protocol MissionDetailViewControllerDelegate: class {
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String)
    
    func missionDetailViewController(controller: MissionDetailViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int)
}
