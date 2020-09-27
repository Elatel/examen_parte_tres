class AddUserToTlike < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :tweets, foreign_key: true
  end
end
