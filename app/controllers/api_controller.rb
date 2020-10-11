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
            @retweeted_from = Tweet.where(:id=>tweet.origin_tweet)
            if @retweeted_from.first != nil
                @retweeted_from.each do |retweet|
                    @from = retweet.id
                    @id.merge!("retweeted_from"=>@from)
                end
            else
                @retweeted_from = 0
                @id.merge!("retweeted_from"=>@retweeted_from)
                
            end
            result.push(@id)
        end
        render :json => result.last(50)
    end
end






