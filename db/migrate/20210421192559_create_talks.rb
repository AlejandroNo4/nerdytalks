class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.belongs_to :author, null: false, foreign_key: false
      t.text :text

      t.timestamps
    end
    add_foreign_key :talks, :users, column: :author_id
  end
end
