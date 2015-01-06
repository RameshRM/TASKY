//
//  ModalDetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/30/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class ModalDetailViewController: DetailViewController {

    @IBAction func onSaved(sender: AnyObject) {
        self.dismissView();
    }
    
    @IBAction func onCancelled(sender: AnyObject) {
        self.dismissView();
    }
    
   

}
