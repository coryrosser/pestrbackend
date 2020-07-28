class AddCreatorToIssues < ActiveRecord::Migration[6.0]
  def change
    add_reference :issues, :creator, references: :users, index: true

    add_foreign_key :issues, :users, column: :creator_id
  end
end
