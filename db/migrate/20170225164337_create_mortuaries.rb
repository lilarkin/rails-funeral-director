class CreateMortuaries < ActiveRecord::Migration[5.0]
  def change
    create_table :mortuaries do |t|
      t.string :name, null: false
      t.string :city
      t.string :state

      t.timestamps
      t.belongs_to :user
    end
  end
end
