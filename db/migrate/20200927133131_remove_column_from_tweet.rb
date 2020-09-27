class RemoveColumnFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :likes_cuantity, :integer
    remove_column :tweets, :re_tweet_cuantity, :integer
    remove_column :tweets, :picture, :string
  end
end
