class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :about
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
