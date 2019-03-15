//
//  tweetCell.swift
//  Twitter
//
//  Created by Mikiann Mcintosh on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class tweetCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetID:Int = -1
    var retweeted:Bool = false
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    

    @IBAction func reTweet(_ sender: Any) {
        let toRetweet = !retweeted
        
        if (toRetweet)
        {
            TwitterAPICaller.client?.reTweet(tweetID: tweetID, success: {
                self.setRetweeted(true)
            }, failure: { (Error) in
                print("Error. Failed to retweet. \(Error)")
            })
        }
        else
        {
            TwitterAPICaller.client?.reTweet(tweetID: tweetID, success: {
                self.setRetweeted(false)
            }, failure: { (Error) in
                print("Error. Failed to unretweet. \(Error)")
            })
        }
        
    }
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        
        if (toBeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite did not succeed. \(Error)" )
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed. \(Error)")
            })
        }
        
    }
    
    
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        
        if(favorited)
        {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        
        if(retweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else
        {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
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
