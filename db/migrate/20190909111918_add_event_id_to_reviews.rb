class AddEventIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :event, null: false, foreign_key: true
  end
end
