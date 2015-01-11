//
//  CommentsDetail.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/30/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class CommentsDetail: ModalDetailViewController {

    @IBOutlet weak var save: UIBarButtonItem!
    var taskyComment = TaskyComments();
    
    @IBOutlet weak var comments: UITextField!

    override func viewDidLoad() {
        super.saveBarButton = self.save;
        self.dataContext = taskyComment;
        super.viewDidLoad()
    }

    @IBAction func textOnChange(sender: AnyObject) {
        taskyComment.comment = (sender as UITextField).text
    }

    
    override func onDataContextSet() {
        super.onDataContextSet();
        taskyComment = self.dataContext as TaskyComments;
    }
}
