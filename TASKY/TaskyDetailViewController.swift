//
//  TaskyDetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/28/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class TaskyDetailViewController: DetailViewController {

 
    @IBOutlet weak var taskyTitle: UILabel!
    @IBOutlet weak var taskyDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func onDataContextSet() {
        super.onDataContextSet();
        var taskyModel:TaskyModel = self.dataContext as TaskyModel;
        self.taskyDescription.text =  taskyModel.taskyDescription;
        self.taskyTitle.text = taskyModel.taskyTitle;
    }
    
}
