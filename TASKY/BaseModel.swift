//
//  BaseModel.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

public class BaseModel : NSObject{
    
    var createdDt: NSDate?;
    var createdBy: NSString?;
    var updatedDt: NSDate?!;
    var updatedBy: NSString?!;
    
    override init(){
        super.init();
    }
    
    
}