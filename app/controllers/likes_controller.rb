class LikesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    
    # Check if the current user is not the organizer of the event
    if @event.user != current_user
      @like = @event.likes.build(user: current_user)
      @like.save
    end
    
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @like = @event.likes.find_by(user: current_user)
    
    # Check if the like exists and the current user is not the organizer of the event
    if @like && @event.user != current_user
      @like.destroy
    end
    
    redirect_to @event
  end
end
