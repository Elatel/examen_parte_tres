class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :picture
      t.integer :likes_cuantity
      t.integer :re_tweet_cuantity

      t.timestamps
    end
  end
end
