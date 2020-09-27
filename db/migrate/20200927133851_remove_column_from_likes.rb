class RemoveColumnFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :likes_cuantity, :integer
    remove_column :likes, :re_tweet_cuantity, :integer
  end
end
