class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :publish_date
      t.string :image
      t.string :author
      t.integer :num_page
      t.float :rate
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :books, [:category_id, :created_at]
  end
end
