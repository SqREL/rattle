class CreateVotes < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE vote_direction AS ENUM ('down', 'up');
    SQL

    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id

      t.column :direction, :vote_direction

      t.timestamps null: false
      t.index [:user_id, :post_id], unique: true
    end
  end

  def down
    drop_table :votes
    execute <<-SQL
      DROP TYPE vote_direction;
    SQL
  end
end
