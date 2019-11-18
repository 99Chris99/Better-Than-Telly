class DropEventReviewsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :event_reviews
  end
end
