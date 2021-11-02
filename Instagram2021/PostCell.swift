//
//  PostCell.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 10/31/21.
//

import UIKit
import AlamofireImage

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameTop: UILabel!
            
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var usernameBottom: UILabel!
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
