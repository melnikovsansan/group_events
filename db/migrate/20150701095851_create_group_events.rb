class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.date :started_on
      t.date :finished_on
      t.string :name
      t.text :description
      t.string :location
      t.datetime :deleted_at
      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
