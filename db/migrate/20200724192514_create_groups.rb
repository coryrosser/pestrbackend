class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.string :group_code

      t.timestamps
    end
  end
end
