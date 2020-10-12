class ApiController < ApplicationController
    ActionController::HttpAuthentication::Basic::ControllerMethods
    http_basic_authenticate_with name: "hello", password: "world", :except => ["news", "date"]
    protect_from_forgery with: :null_session
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

    def date
        fecha_uno = params[:fecha1]
        fecha_dos = params[:fecha2]
        @tweets = Tweet.created_at(fecha_uno,fecha_dos)
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

    def create
        @tweet = Tweet.create(tweet_params)
        render :json => @tweet
    end

    private

    def tweet_params
        params.require(:tweet).permit(:content, :user_id, :origin_tweet)
    end
end






