class ChangeQuestionTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :location
    add_column :questions, :latitude, :float
    add_column :questions, :longitude, :float
  end
end
