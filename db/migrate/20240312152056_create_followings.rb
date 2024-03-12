class CreateFollowings < ActiveRecord::Migration[7.1]
  def change
    create_table :followings do |t|
      t.belongs_to :user, foreign_key: true

      t.string :following_user_email

      t.timestamps
    end
  end
end
