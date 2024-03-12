class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, foreign_key: true

      t.string :headline
      t.string :tweet

      t.timestamps
    end
  end
end
