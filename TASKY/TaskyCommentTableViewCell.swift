//
//  TaskyCommentTableViewCell.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 1/10/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class TaskyCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var taskyComment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setComments(comments: NSString)->Void{
        self.taskyComment.text = comments;
    }
}
