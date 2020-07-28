class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.belongs_to :issue, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
