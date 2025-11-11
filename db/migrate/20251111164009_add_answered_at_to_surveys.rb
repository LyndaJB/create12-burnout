class AddAnsweredAtToSurveys < ActiveRecord::Migration[8.1]
  def change
    add_column :surveys, :answered_at, :timestamp
  end
end
