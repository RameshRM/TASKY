//
//  TaskyModel.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/23/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation

public class TaskyModel : CRUDBaseModel {
    
    var taskyID: Int?;
    var taskyTitle: NSString?;
    var taskyDescription: NSString?;
    
    var taskyStatus: Int?{
        willSet(newData){
        }
        didSet{
            observeChange("taskyStatus",oldData:oldValue!,newData:taskyStatus!);
        }
    };

    var timeLine: TimeLineModel?;
    var belongsTo: TaskyUser?;
    var taskyPriority : Int?;
    
    init(title:NSString, description: NSString, status: Int){
        self.taskyTitle = title;
        self.taskyDescription = description;
        self.taskyStatus = status;
        self.taskyPriority = TaskyPriorities.Normal;
        super.init();
    }
    

    
    class func mockTasks()->[TaskyModel]{
        var tasks:[TaskyModel] = [];
        var format = NSDateFormatter();
        format.dateFormat = "MM/dd/yyyy";
        var startDt = format.dateFromString("12/22/2014");
        var endDt = format.dateFromString("1/6/2015");
        
        var timeLine:TimeLineModel = TimeLineModel(title: "Important Tasks", description: "Some Description", start: startDt!);
        
        var tasky: TaskyModel = TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        tasky =  TaskyModel(title: "Start Some Random Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        
        
        tasky =  TaskyModel(title: "Start Some Task", description: "Implement Native App for Tasky", status: TaskyStatusCodes.Active);
        tasky.timeLine = timeLine;
        tasks.append(tasky);
        
        return tasks;
    }
    
    class func mockTasks(searchBy: NSString) -> [AnyObject]{
        var filter = NSPredicate(format: " (self.taskyTitle contains[c] %@) OR (self.taskyDescription contains[c] %@)", searchBy, searchBy);
        println(filter);
        var mocks = self.mockTasks();
        var mutable = NSMutableArray(array: mocks);
        return mutable.filteredArrayUsingPredicate(filter!);
    }
    
}
