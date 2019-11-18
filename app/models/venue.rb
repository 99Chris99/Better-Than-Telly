class Venue < ApplicationRecord
    has_many :events

    validates :name, :address, presence: true

    def has_events?
        !self.events.empty?
    end


    def future_events?
        self.events.any? do |event|
            event[:event_date] > Date.today
          end
      end
   

end
