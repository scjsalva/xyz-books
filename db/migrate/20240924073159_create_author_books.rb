class CreateAuthorBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :author_books, id: :uuid do |t|
      t.references :author, null: false, foreign_key: true, type: :uuid
      t.references :book, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :author_books, :created_at
  end
end
