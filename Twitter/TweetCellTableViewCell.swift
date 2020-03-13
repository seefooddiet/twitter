//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Deon Labrador on 3/12/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileUserNameLabel: UILabel!
    
    
    @IBOutlet weak var profileTweetLabel: UILabel!
    
    var favorited:Bool = false
    var tweetID: Int = -1
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favoriteButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            
            
        }else{
            favoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
      let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: {(error) in print("favorite did not succed: \(error))")
                
            })
        }else{
            
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: {(error) in print("unfavorited did not succed: \(error)")})
            
        }
      
        
        
    }
    
    
    @IBAction func retweetButton(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
            self.setRetweeted(true)
        }, failure: {(error) in print("error in retweeting")})
        
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
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
