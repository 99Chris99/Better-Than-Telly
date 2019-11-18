class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  
  has_many :reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees

  accepts_nested_attributes_for :venue

  validates :title, :description, :event_date, :event_time, :venue_id, :category_id, presence: true

  def self.all_future_events_in_date_order
    get_future_dates = self.all.select do |event|
        event[:event_date] > Date.today
      end
    get_future_dates.sort {|a,b| a.event_date <=> b.event_date }
  end

  def event_in_future?
    self.event_date > Date.today
  end

  def event_attendees_list
      self.users
  end

  def attendance?
    self.users.include?(@current_user)
  end

  def event_attendee?
    #will return true if their attendee record is not empty (e.g. they attended)
    if EventAttendee.where(event_id: self.id, user_id: @current_user)
      return true
    end
  end

  def in_future_and_attending
    self.event_in_future? && self.event_attendee?
  end


  def self.category_filter(search_term)
    select_array = []

    if search_term.present?
      category = Category.find_by(name: search_term["name"])
      if category.present?
        filtered = Event.all_future_events_in_date_order.select{|event|event.category_id == category.id}
        select_array.unshift(filtered)
        select_array.push(category.name)
      else
        select_array.unshift(Event.all_future_events_in_date_order)
        select_array.push("All Categories")
      end

    else
      select_array.unshift(Event.all_future_events_in_date_order)
        select_array.push("All Categories")
    end
  
  end

  # def self.drop_down_select(events)
  #     if events.present?
  #     category = events.first.category_id
  #     name = Category.find(category).name
  #     else
  #       name = "All Categories"
  #     end
  #     return name
  # end
  

end
