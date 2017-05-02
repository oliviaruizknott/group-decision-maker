class AddPasscodeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :passcode, :string, null: false
  end
end
