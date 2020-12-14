class AddDefaultToType < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :default, :boolean
  end
end
