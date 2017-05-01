class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :vote_text, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
