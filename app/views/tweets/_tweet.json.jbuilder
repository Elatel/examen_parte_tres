json.extract! tweet, :id, :content, :picture, :likes_cuantity, :re_tweet_cuantity, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
