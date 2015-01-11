//
//  CRUDBaseModel.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 1/8/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class CRUDBaseModel : BaseModel, ChangeObserverProtocol{
    let dirtyModelNotificationKey = "CRUDBaseModel.Dirty";
    
    var isDirty:Bool!{
        willSet(newData){
            
        }
        didSet{
            onDirtyModel();
        }
    };
    
    override init(){
        isDirty = false;
        super.init();
    }
    
 
    func observeChange(name: NSString, oldData: AnyObject!, newData: AnyObject!) -> Void{
        if(!self.isDirty){
            self.isDirty = true;
        }
    }
    
    private func onDirtyModel()-> Void{
        NSNotificationCenter.defaultCenter().postNotificationName(dirtyModelNotificationKey, object: self)
    }

    
}