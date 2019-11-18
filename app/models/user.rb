class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees

    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    def get_events
        self.events
    end

    def get_host_events
        Event.where(user_id: self.id)
    end


    def get_past_events
        get_events.select{|event| event.event_date < Date.today}
    end

    def get_future_events
        get_events.select{|event| event.event_date >= Date.today}
    end

    def get_past_host_events
        get_host_events.select{|event| event.event_date < Date.today}
    end

    def get_future_host_events
        get_host_events.select{|event| event.event_date >= Date.today}
    end

    # ********** Reccomendation Engine ***************


    #call this method to get reccomened events for a user
    def reccomend_me
        event_list = score_events.keys
        event_list.first 5
    end


    ####### These methods check a users favourites against events #########
    
    def score_assign(hash_item, event_attribute)
        score = 0
        if hash_item[0] == event_attribute
            score = 3
        elsif hash_item[1] == event_attribute
            score = 2
        elsif hash_item[2] == event_attribute
            score = 1
        else
            score = 0
        end
        return score
    end

    def score_events
        ranking = Hash.new(0)
        
        Event.all_future_events_in_date_order.each do |event|
            
            category = score_assign(favourite_profile[:categories], event.category_id)
            host = score_assign(favourite_profile[:hosts], event.user_id)
            venue = score_assign(favourite_profile[:venues], event.venue_id)

            total = (category + host + venue)

            ranking[event.id]=total
        end
        sort_by_soonest = ranking.sort_by{|key,value| Event.find(key).event_date}.to_h
        return ranking.sort_by{|key,value| -value}.to_h
    end

    ################################################################


    ####### These methods determin a users favourites ############

    def get_positive_reviews
        all_reviews = Review.where(user_id: self.id)
        all_reviews.select{|review|review.rating > Review.rating_range.max/2 }
        return all_reviews
    end


    def top_three(list1,list2)
        if list1 == 0 
            list_merge = list2.flatten.each_slice(2).map(&:first).uniq
        else
            list_merge = list1.push(list2).flatten.each_slice(2).map(&:first).uniq
        end
        three_only = list_merge.first 3
    end

    def favourite_profile
        categories = top_three(get_favourite_cat_by_reviews, get_favourite_cat_by_attendence)
        hosts =  top_three(get_favourite_host_by_reviews, get_favourite_host_by_attendence)
        venues = top_three(get_favourite_venue_by_reviews, get_favourite_venue_by_attendence)
    
        favourites = {:categories => categories, :hosts => hosts, :venues => venues}
        return favourites
    end

    
    #Category Based
    def get_favourite_cat_by_attendence
        if get_events != []
             cat_hash = Hash.new(0)
             get_events.each do |event|    
                 cat_hash[event.category_id] += 1
            end
        else
            cat_hash  = Hash.new(0)
            Event.all_future_events_in_date_order.each do |event|    
                cat_hash[event.category_id] += 1
            end
        end
        cat_hash.sort_by{|category,total_rating| -total_rating}
    end

    def get_favourite_cat_by_reviews
        if get_positive_reviews != []
            cat_hash  = Hash.new(0)
            get_positive_reviews.each do |review|    
                cat_hash[review.event.category_id] += review.rating
            end
            cat_hash.sort_by{|category,total_rating| -total_rating}
        else
        0
        end
    end

    #Host_based

    def get_favourite_host_by_reviews
        if get_positive_reviews != []
            host_hash = Hash.new(0)
            get_positive_reviews.each do |review|
                host_hash[review.event.user_id] += review.rating
            end
            host_hash.sort_by {|host, total_rating| -total_rating}
        else
            0
        end
    end

    def get_favourite_host_by_attendence
        if get_events != []
            host_hash  = Hash.new(0)
            get_events.each do |event|    
                host_hash[event.user_id] += 1
            end
            
        else
            host_hash  = Hash.new(0)
            Event.all_future_events_in_date_order.each do |event|    
                host_hash[event.user_id] += 1
            end
        end
        host_hash.sort_by{|host,total_rating| -total_rating}
    end

    #Venue Based

    def get_favourite_venue_by_reviews
        if get_positive_reviews != []
            venue_hash = Hash.new(0)
            get_positive_reviews.each do |review|
                venue_hash[review.event.venue_id] += review.rating
            end
            venue_hash.sort_by {|venue, total_rating| -total_rating}
        else
            0
        end
    end

    def get_favourite_venue_by_attendence
        if get_events != []
            venue_hash  = Hash.new(0)
            get_events.each do |event|    
                venue_hash[event.venue_id] += 1
            end
        else
        #default list...
        venue_hash  = Hash.new(0)
        Event.all_future_events_in_date_order.each do |event|    
            venue_hash[event.venue_id] += 1
            end
        end
        venue_hash.sort_by{|venue,total_rating| -total_rating}
    end

 
#########################################################




    
end#class end
