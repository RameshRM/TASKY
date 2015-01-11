//
//  TaskyComments.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

public class TaskyComments : CRUDBaseModel{
    
    var taskyID: Int?;
    var comment: NSString?{
        willSet(newData){
        }
        didSet{
            self.observeChange("comment", oldData: "old", newData: comment!)
        }
    };
}