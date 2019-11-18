class VenuesController < ApplicationController
    before_action :find_venue, only: [:show]
    before_action :require_login, only: [:show, :new, :update]


    def index
        @venues = Venue.all
    end

    def show

    end

    def new
        @venue = Venue.new
    end

    def create
        venue = Venue.create(venue_params)
        if venue.valid?
            redirect_to venue_path(venue)
        else 
            flash[:errors] = venue.errors.full_messages
            redirect_to new_venue_path
        end
    end

    private

    def find_venue
        @venue = Venue.find(params[:id])
    end

    def venue_params
        params.require(:venue).permit(:name, :address)
    end
end
