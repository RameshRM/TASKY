//
//  TaskyDetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/28/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class TaskyDetailViewController: DetailViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var taskyComments: UITableView!
    @IBOutlet weak var taskyTitle: UILabel!
    @IBOutlet weak var taskyDescription: UILabel!
    var taskyModel:TaskyModel!;
    var comments:[TaskyComments] = [TaskyComments]();
    
    @IBAction func onStatusChanged(sender: AnyObject) {
        println(sender.selectedSegmentIndex);
        self.taskyModel.taskyStatus = sender.selectedSegmentIndex;
    }
    
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var taskyStatus: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad();
        println(self.dataContext);
        super.saveButton = self.save;
        self.onMessage(self.detailViewCompleteKey, callback: { (result) -> Void in
            var crud:TaskyComments = result as TaskyComments;
            self.setCommentsDataCtx(crud);
        });
        self.taskyComments.delegate = self;
        self.taskyComments.dataSource = self;
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
        taskyModel = self.dataContext as TaskyModel;
        self.taskyDescription.text =  taskyModel.taskyDescription;
        self.taskyTitle.text = taskyModel.taskyTitle;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskyModel.comments.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.taskyComments.dequeueReusableCellWithIdentifier("taskyComments") as TaskyCommentTableViewCell;
        var comment = self.taskyModel.comments[indexPath.row];
        cell.setComments(comment.comment!);
        return cell;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 65;
    }
    
    func setCommentsDataCtx(comment: TaskyComments)->Void{
        self.taskyModel.comments.append(comment);
        self.taskyComments.reloadData();

    }
    
}
