class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.integer :urgency
      t.integer :status
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
