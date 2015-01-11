//
//  TaskyItemTableViewCell.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/24/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class TaskyItemTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskyItemStatus: UILabel!
    @IBOutlet weak var taskyItemTitle: UILabel!
    
    @IBOutlet weak var taskyPriority: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func disabled()->Void{
        taskyItemStatus.enabled=false;
        taskyItemTitle.enabled=false;
    }

    private func enabled()->Void{
        taskyItemStatus.enabled=true;
        taskyItemTitle.enabled=true;
    }

    func dataBind(taskyModel: TaskyModel, isEnabled: Bool){
        self.taskyItemTitle.text  = taskyModel.taskyTitle;
    }
}
