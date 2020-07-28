class AddAssignedUserToIssues < ActiveRecord::Migration[6.0]
  def change
    add_reference :issues, :assigned_user, references: :users, index: true

    add_foreign_key :issues, :users, column: :assigned_user_id
  end
end
