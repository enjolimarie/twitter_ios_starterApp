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

    var favorited:Bool = false
    var tweetId:Int = -1
    var Retweeted:Bool = false
    

    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { error in
                print("Favorited did not succeed \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { error in
                print("Unfavorited did not succeed \(error)")
            })
        } 
    }



    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !Retweeted
        if (toBeRetweeted){
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { error in
                print("Error retweeting \(error)")
            })
        }else{
        TwitterAPICaller.client?.unretweet(tweetId: tweetId, success: {
            self.setRetweeted(false)
        }, failure: { error in
            print("Error unretweeting \(error)")
            //hello
        })
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        Retweeted = isRetweeted
        if(Retweeted){
            retweetButton.setImage(UIImage(named:"repost-icon-blue"), for: UIControl.State.normal)
           // retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named:"repost-icon"), for: UIControl.State.normal)
           // retweetButton.isEnabled = true
        }
    }

    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"fav-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named:"fav-icon"), for: UIControl.State.normal)
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
