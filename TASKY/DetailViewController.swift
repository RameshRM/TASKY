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
    
    var dataContext: AnyObject? {
        willSet(newData){
            hasData = newData != nil;
        }
        didSet{
            
        }
    };
    
    func onDataContextSet() {
        println("Base.Set");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        if(hasData){
            onDataContextSet();
        }
    }
 
    @IBAction func onSave(sender: AnyObject) {
        self.closeChildView(self);
    }
    
    func dismissView()->Void{
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            println("CLosed");
        });
    }
}
