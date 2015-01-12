//
//  CommentsDetail.swift
//  TASKY
//
//  Created by Mahadevan, Ramesh on 12/30/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit

class CommentsDetail: ModalDetailViewController, UITextFieldDelegate {

    @IBOutlet weak var save: UIBarButtonItem!
    var taskyComment = TaskyComments();
    
    @IBOutlet weak var comments: UITextField!

    override func viewDidLoad() {
        comments.delegate = self;
        super.saveBarButton = self.save;
        self.dataContext = taskyComment;
        super.viewDidLoad()
        self.comments.becomeFirstResponder();
    }

    @IBAction func textOnChange(sender: AnyObject) {
        taskyComment.comment = (sender as UITextField).text
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true;
    }
    
    override func onDataContextSet() {
        super.onDataContextSet();
        taskyComment = self.dataContext as TaskyComments;
    }
}
