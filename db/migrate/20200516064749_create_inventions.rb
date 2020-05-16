class CreateInventions < ActiveRecord::Migration[5.1]
  def change
    create_table :inventions do |t|
      t.string :name
      t.integer :power
      t.references :scientist, foreign_key: true

      t.timestamps
    end
  end
end
