//
//  FeedViewController.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 11/1/21.
//


import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // to refresh the table view after composing a new post
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKeys(["user", "caption", "image"])
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
        
    }
    
    // numberOfRowsInSection and cellForRowAt are the 2 required func for data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        let user = post["user"] as! PFUser
        
        cell.usernameTop.font = UIFont.boldSystemFont(ofSize: 16.0); // bold the username
        cell.usernameTop.text = user.username
        
        cell.usernameBottom.font = UIFont.boldSystemFont(ofSize: 16.0);
        cell.usernameBottom.text = user.username
        
        cell.caption.text = (post["caption"] as! String)
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
                
        // cell.profileImage.af.setImage(withURL: url)
        cell.postImage.af.setImage(withURL: url)
        
        return cell
    }
    
}


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

