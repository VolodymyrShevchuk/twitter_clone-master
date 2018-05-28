class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.timestamps
    end

      add_index :likes, [:tweet_id, :user_id], unique: true

  end
end
