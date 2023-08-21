class EventsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @events = Event.all#current_user.events
    else
      @events = Event.all
    end
  
    if @events.empty?
      flash[:notice] = "No events found"
      redirect_to new_event_path
    end
  end

  def my_created_events
    if user_signed_in?
      @events = current_user.events
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event
      @event
    else
      flash[:alert] = "Event not found"
      redirect_to events_path
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:id])
  
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end
    
  def list_all_events
    @events = Event.includes(:user)
  end
# create routes for this events and vivew
#debugger
  def search_events
    query = params[:query]
    @events = Event.includes(:user)
                  .where('name LIKE ?', "%#{query}%")
                  # .or(User.where('users.name LIKE ?', "%#{query}%"))
                  # .or(User.where('users.email LIKE ?', "%#{query}%"))
                  # .or(User.where('users.city LIKE ?', "%#{query}%"))
      
    render @events
  end



  #debugger
  # def search_events
  #   query = params[:query]
    
  #   if query.present?
  #     query = query.downcase

  #     @events = Event.includes(:user)
  #                   .where('LOWER(events.name) LIKE ?', "%#{query}%")
  #                   .or(User.where('LOWER(users.name) LIKE ?', "%#{query}%"))
  #                   .or(User.where('LOWER(users.email) LIKE ?', "%#{query}%"))
  #                   .or(User.where('LOWER(users.city) LIKE ?', "%#{query}%"))

  #     render @events
    
  #   end
  # end
  
  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :city,:user_id)
  end  
end
