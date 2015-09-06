class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.integer :post_id
      t.text    :body

      t.timestamps null: false
      t.index [:owner_id, :post_id]
    end
  end
end
