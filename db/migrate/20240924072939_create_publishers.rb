class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers, id: :uuid do |t|
      t.string :name, null: false
      t.text :logo_url

      t.timestamps
    end

    add_index :publishers, :created_at
  end
end
