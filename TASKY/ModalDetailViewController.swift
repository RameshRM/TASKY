//
//  ModalDetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/30/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class ModalDetailViewController: DetailViewController {
    
    var saveBarButton: UIBarItem!{
        willSet(newData){
            
        }
        didSet{
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        if(self.saveBarButton != nil){
            self.saveBarButton.enabled = false;
        }
    }
    
    
    @IBAction func onSaved(sender: AnyObject) {
        self.dismissView(self.dataContext);
    }
    
    
    @IBAction func onCancelled(sender: AnyObject) {
        self.dismissView();
    }
    
    
    override func onDirtyDataContext()->Void{
        if(self.saveBarButton != nil){
            self.saveBarButton.enabled = self.dataContext.isDirty;
        }
    }
    
    
    
    
}
