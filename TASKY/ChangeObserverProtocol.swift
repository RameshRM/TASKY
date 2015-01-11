//
//  ChangeObserverProtocol.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 1/8/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation


@objc protocol  ChangeObserverProtocol{
    func observeChange(name: NSString, oldData: AnyObject!, newData: AnyObject!) -> Void;
    
}