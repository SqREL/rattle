class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title, limit: 512
      t.string  :url, limit: 1024
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
