class AddAnsweredByToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :answered_by, :string
  end
end
