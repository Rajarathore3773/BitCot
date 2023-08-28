class DislikesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    
    # Check if the current user is not the organizer of the event
    if @event.user != current_user
      @dislike = @event.dislikes.build(user: current_user)
      @dislike.save
    end
    
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @dislike = @event.dislikes.find_by(user: current_user)
    
    # Check if the dislike exists and the current user is not the organizer of the event
    if @dislike && @event.user != current_user
      @dislike.destroy
    end
    
    redirect_to @event
  end
end
