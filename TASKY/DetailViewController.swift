//
//  DetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/28/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class DetailViewController: MainViewController, DetailViewProtocol {
    var hasData : Bool = false;
    let detailViewCompleteKey = "DetailView.IsComplete";
    var messageSubscriptions:[NSString: (AnyObject!)->Void] = [:];
    
    var saveButton: UIButton!{
        willSet(newData){
            
        }didSet{
        }
    };
    
    
    var dataContext: CRUDBaseModel! {
        willSet(newData){
            hasData = newData != nil;
        }
        didSet{
            
        }
    };
    
    func onDataContextSet() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onDirtyDataContext", name: dataContext.dirtyModelNotificationKey, object: dataContext);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        if(hasData){
            onDataContextSet();
        };
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "subscribe:", name: detailViewCompleteKey, object: nil)
        
    }
    
    @IBAction func onSave(sender: AnyObject) {
        self.closeChildView(self);
    }
    
    
    func dismissView()->Void{
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            
        });
    }
    
    func dismissView(args: CRUDBaseModel)->Void{
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.propagateNotification(args, notificationKey: self.detailViewCompleteKey);
        });
    }
    
    func onDirtyDataContext()->Void{
        if(self.saveButton != nil){
            self.saveButton.enabled = self.dataContext.isDirty;
        }
    }
    
    func subscribe(message: NSNotification) {
        var comment = message.userInfo![detailViewCompleteKey] as TaskyComments;
        self.fanoutForSubscribers(detailViewCompleteKey, userInfo: message.userInfo![detailViewCompleteKey]);
    }
    
    func propagateNotification(saveArgs: CRUDBaseModel!, notificationKey: NSString){
        var today = NSDate();
        var data = [notificationKey : saveArgs];
        NSNotificationCenter.defaultCenter().postNotificationName(detailViewCompleteKey, object: nil, userInfo: data);
    }
    
    func onMessage(message:NSString, callback: (result: AnyObject!) -> Void) -> Void{
        messageSubscriptions.updateValue(callback, forKey: message);
    }
    
    private func fanoutForSubscribers(message: NSString, userInfo: AnyObject!)->Void{
        if(messageSubscriptions[message] != nil){
            var callback = messageSubscriptions[message]!;
            callback(userInfo);
        }
    }
    
}