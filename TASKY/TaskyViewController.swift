//
//  TaskyViewController.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/24/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class TaskyViewController: ListViewController, UISearchBarDelegate, UISearchDisplayDelegate   {
    
    @IBOutlet weak var filterSearch: UISearchBar!
    @IBOutlet weak var taskyList: UITableView!
    
    var taskies:[TaskyModel] = TaskyModel.mockTasks();
    var selectedTasky:TaskyModel?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView = taskyList;
        self.prepareTableView("taskyItem");
        self.dataContext = taskies;
        filterSearch.delegate=self;
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailItem"){
            var rowIdx = self.taskyList.indexPathForSelectedRow()?.row;
            selectedTasky = self.taskies[rowIdx!];
            var detailView = segue.destinationViewController as TaskyDetailViewController;
            detailView.dataContext = selectedTasky;
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 65;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder();
        var result = TaskyModel.mockTasks(searchBar.text);
        self.dataContext = result;
        self.tableView.reloadData();
    }
    
    override func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath) -> Void{
        var cell = tableCell as TaskyItemTableViewCell;
        var taskyModel = rowData as TaskyModel;
        cell.taskyItemTitle.text  = taskyModel.taskyTitle;
        cell.taskyItemTitle.text  = taskyModel.taskyTitle;
        cell.taskyItemStatus.text  = "Yesterday";
        if(indexPath.row == 2){
        cell.taskyItemStatus.text  = "Today";
        }
        if(indexPath.row == 3){
            cell.taskyItemStatus.text  = "2 Days";
        }
        if(indexPath.row == 4){
            cell.taskyItemStatus.text  = "39 Days";
            cell.taskyItemStatus.textColor = UIColor(red: 0.5, green: 0.2, blue: 0.2, alpha: 1.0);
        }
        
        cell.taskyPriority.text = TaskyPriorities.priorityName(taskyModel.taskyPriority!);
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        searchBar.text = "";
        searchBar.resignFirstResponder();
        var result = TaskyModel.mockTasks();
        self.dataContext = result;
        self.tableView.reloadData();
    }
    
    func onTapped(){
        println("Tapped");
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(true, animated: true);
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(false, animated: true);
    }
}
