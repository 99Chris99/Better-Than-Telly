class EventAttendeesController < ApplicationController

    def create
        @event = EventAttendee.create(user_id: session[:user_id], event_id: params[:id])
        redirect_to event_path(@event.event_id)
    end

    # def destroy
    #     @event = EventAttendee.where(user_id: session[:user_id], event_id: params[:id])
    #     @event.destroy
    #     redirect_to events_path
    # end

end
