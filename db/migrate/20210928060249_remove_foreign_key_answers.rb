class RemoveForeignKeyAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :auther_id, :references
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
