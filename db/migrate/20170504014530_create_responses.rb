class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :score, null: false
      t.belongs_to :option, null: false

      t.timestamps
    end
  end
end
