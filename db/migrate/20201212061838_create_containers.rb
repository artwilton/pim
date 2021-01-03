class CreateContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :containers do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.integer :percent_used
      t.string :barcode
      t.belongs_to :type, null: false, foreign_key: true
      
      t.references :parent, foreign_key: { to_table: :containers}
      t.timestamps
    end
  end
end