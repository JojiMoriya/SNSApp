//
//  TimelineViewController.swift
//  stechTask2SNS
//
//  Created by 守屋譲司 on 2020/10/12.
//

import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    var me: UserData!
    var database: Firestore!
    
    var postArray:[Any] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        database.collection("posts").getDocuments { (snapshot, error) in
            if error == nil, let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let post = Data(data: data)
                    self.postArray.append(post)
                }
                self.timelineTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        database = Firestore.firestore()
        timelineTableView.delegate = self
        timelineTableView.dataSource = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddViewController
        destination.me = sender as? UserData
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            cell.textLabel?.text = postArray[indexPath.row].content
            return cell
        }

}
