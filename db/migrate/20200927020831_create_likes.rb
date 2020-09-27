class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :likes_cuantity
      t.integer :re_tweet_cuantity

      t.timestamps
    end
  end
end
