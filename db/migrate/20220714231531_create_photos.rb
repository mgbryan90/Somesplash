class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.integer :comments_count, default: 0

      t.timestamps
    end
    add_index :photos, :title, unique: true
  end
end
