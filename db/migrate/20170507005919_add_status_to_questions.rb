class AddStatusToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :status, :string, null: false, default: "open"
  end
end
