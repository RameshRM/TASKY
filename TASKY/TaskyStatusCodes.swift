//
//  TaskyStatusCodes.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

struct TaskyStatusCodes{
    static let Active:Int = 1;
    static let Resolved:Int = 2;
    static let Complete:Int = 3;
    static let InProgress:Int = 4;
    static let Other:Int = 5 ;
    
    static let TaskyStatusCodesKVP:NSDictionary = [1:"Active", 2: "Resolved", 3: "Complete", 4: "In Progress", 5: "Other"];
    
    static func statusNameForCode(statusCode: Int)->NSString{
        return self.TaskyStatusCodesKVP.objectForKey(statusCode) as NSString!;
    }
    
}
