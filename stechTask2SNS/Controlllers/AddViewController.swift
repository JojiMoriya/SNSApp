//
//  AddViewController.swift
//  stechTask2SNS
//
//  Created by 守屋譲司 on 2020/10/12.
//

import UIKit
import Firebase

class AddViewController: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
    
    var me: UserData!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func postContent(_ sender: UIButton) {
        let content = contentTextView.text!
            let saveDocument = Firestore.firestore().collection("posts").document()
            saveDocument.setData([
                "content": content,
                "postID": saveDocument.documentID,
                "senderID": me.userID,
                "createdAt": FieldValue.serverTimestamp(),
                "updatedAt": FieldValue.serverTimestamp()
            ]) { error in
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                }
            }
    }
    
    func setupTextView() {
        let toolBar = UIToolbar()
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        toolBar.items = [flexibleSpaceBarButton, doneButton]
        toolBar.sizeToFit()
        contentTextView.inputAccessoryView = toolBar
    }

    // キーボードを閉じる処理
    @objc func dismissKeyboard() {
        contentTextView.resignFirstResponder()
    }
    
}
