class AddDefaultToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :default, :boolean
  end
end
