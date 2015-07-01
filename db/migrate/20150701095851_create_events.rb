class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_on
      t.date :finish_on
      t.string :name
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
