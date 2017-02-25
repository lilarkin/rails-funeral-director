class CreateFunerals < ActiveRecord::Migration[5.0]
  def change
    create_table :funerals do |t|
      t.belongs_to :deceased, foreign_key: true
      t.string :location, null: false
      t.string :time, null: false
      t.string :date, null: false

      t.timestamps
    end
  end
end
