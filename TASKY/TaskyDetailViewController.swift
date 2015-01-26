//
//  TaskyDetailViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/28/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class TaskyDetailViewController: DetailViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noResultsLabel: UILabel!
    
    @IBOutlet weak var taskyComments: UITableView!
    @IBOutlet weak var taskyTitle: UILabel!
    @IBOutlet weak var taskyDescription: UILabel!
    var reversedComments:[TaskyComments]=[TaskyComments]();
    var taskyModel:TaskyModel!;
    var comments:[TaskyComments] = [TaskyComments]();
    
    @IBAction func onStatusChanged(sender: AnyObject) {
        self.taskyModel.taskyStatus = sender.selectedSegmentIndex;
    }
    
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var taskyStatus: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad();
        super.saveButton = self.save;
        self.onMessage(self.detailViewCompleteKey, callback: { (result) -> Void in
            var crud:TaskyComments = result as TaskyComments;
            self.setCommentsDataCtx(crud);
        });
        self.setCommentsDataCtx();
        self.taskyComments.delegate = self;
        self.taskyComments.dataSource = self;
        showTableWhenData();
        var tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("onTapped"));
        self.view.addGestureRecognizer(tapGesture);
   
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
        if(reversedComments.count>0){
            var comment = reversedComments[indexPath.row];
            cell.setComments(comment.comment!);
        }
        return cell;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 40;
    }
    
    func setCommentsDataCtx(comment: TaskyComments)->Void{
        self.taskyModel.comments.append(comment);
        reversedComments = self.taskyModel.comments.reverse();
        let indexPath = NSIndexPath(forRow: reversedComments.count-1, inSection: 0);
        
        showTableWhenData();
        self.taskyComments.reloadData();
        self.taskyComments.reloadRowsAtIndexPaths(	[indexPath], withRowAnimation: .Automatic);
    }
    
    func setCommentsDataCtx()->Void{
        reversedComments = self.taskyModel.comments.reverse();
        let indexPath = NSIndexPath(forRow: reversedComments.count-1, inSection: 0);
        showTableWhenData();
        self.taskyComments.reloadData();
//        self.taskyComments.reloadRowsAtIndexPaths(	[indexPath], withRowAnimation: .Automatic);
    }
    
    private func showTableWhenData()->Void{
        if(self.taskyModel.comments.count == 0){
            self.taskyComments.hidden=true;
            self.noResultsLabel.hidden = false;
        }else{
            self.taskyComments.hidden=false;
                        self.noResultsLabel.hidden = true;
        }
        self.noResultsLabel.hidden = true;
            self.taskyComments.hidden=true;
    }
    
    
    @objc func onTapped(){
        view.endEditing(true);
    }
    
}
