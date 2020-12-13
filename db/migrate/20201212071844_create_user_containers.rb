class CreateUserContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_containers do |t|
      t.belongs_to :container, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
