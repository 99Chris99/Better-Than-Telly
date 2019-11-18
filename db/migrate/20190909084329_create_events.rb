class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.time :event_time
      t.string :descripton
      t.references :category, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
