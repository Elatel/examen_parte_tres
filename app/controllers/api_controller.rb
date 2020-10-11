class ApiController < ApplicationController
    def news
        @tweets = Tweet.all
        result = []
        @users = User.all
        @tweets.each do |tweet|
            @id = {"id"=>tweet.id}
            @id.merge!("content"=>tweet.content)
            @id.merge!("user_id"=>tweet.user_id)
            @like = Like.where(:tweet_id=>tweet.id).count
            @id.merge!("like_count"=>@like)
            @re_tweet = Tweet.where(:origin_tweet=>tweet.id).count
            @id.merge!("retweet_count"=>@re_tweet)
            @retweeted_from = Tweet.where(:origin_tweet=>@users)
            @id.merge!("retweeted_from"=>@retweeted_from)
            result.push(@id)
        end
        render :json => result
    end
end






