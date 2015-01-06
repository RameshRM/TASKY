//
//  TimeLineModel.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

public class TimeLineModel  : BaseModel{
    var timeLineTitle: NSString?;
    var timeLineDescription: NSString?;
    var startDt:NSDate?;
    var endDt:NSDate?!;
    var timeLineID: Int?;

 
    init(title:NSString, description: NSString, start: NSDate){
        self.timeLineTitle = title;
        self.timeLineDescription = description;
        self.startDt = start;
        super.init();
    }

}