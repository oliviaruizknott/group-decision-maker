class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :passcode, null: false

      t.timestamps
    end
  end
end
