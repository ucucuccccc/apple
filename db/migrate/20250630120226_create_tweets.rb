class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :member
      t.text :record

      t.timestamps
    end
  end
end
