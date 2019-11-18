class CreateEventReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :event_reviews do |t|
      t.references :event, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
