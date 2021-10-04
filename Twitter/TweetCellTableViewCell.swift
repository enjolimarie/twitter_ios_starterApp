//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Cynthia Gonzalez on 10/4/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!


    @IBAction func favoriteTweet(_ sender: Any) {
    }

    
    @IBAction func retweet(_ sender: Any) {
    }
    
    var favorited:Bool = false
    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named: "fav-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "fav-icon"), for: UIControl.State.normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
