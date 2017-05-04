class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :text, null: false
      t.string :notes
      t.belongs_to :question, null: false

      t.timestamps
    end
  end
end
