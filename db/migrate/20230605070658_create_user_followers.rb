class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }
      t.references :following, index: true, foreign_key: { to_table: :users }
      t.string :follow_status

      t.timestamps
    end
  end
end
