class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :option_text, null: false
      t.belongs_to :question, null: false

      t.timestamps
    end
  end
end
