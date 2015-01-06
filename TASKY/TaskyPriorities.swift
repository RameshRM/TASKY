//
//  TaskyPriorities.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/24/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation


struct TaskyPriorities{
    static let Absolute:Int = 1;
    static let High:Int = 2;
    static let Medium:Int = 3;
    static let Low:Int = 4;
    static let Normal:Int = 5;
    static let Other:Int = 6;
    static let TaskyPrioritiesKVP:NSDictionary = [1:"Absolute", 2: "High", 3:"Medium", 4: "Low", 5: "Normal", 6: "Other"];
    
    static func priorityName(priority: Int)->NSString{
        return self.TaskyPrioritiesKVP.objectForKey(priority) as NSString!;
    }
    
}
