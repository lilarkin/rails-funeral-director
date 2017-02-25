class CreateDeceaseds < ActiveRecord::Migration[5.0]
  def change
    create_table :deceaseds do |t|
      t.belongs_to :mortuary, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :birthdate, null: false
      t.string :deathdate, null: false
      t.string :cod, null: false

      t.timestamps
    end
  end
end
