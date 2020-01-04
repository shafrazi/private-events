class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.order(date: :asc).upcoming_events
    @past_events = Event.order(date: :asc).past_events
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
    @users = User.all
    @uninvited_users = []
    @users.each do |user|
      unless @event.invitees.include?(user) || user == current_user || @event.attendees.include?(user)
        @uninvited_users << user
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully."
      redirect_to @event
    else
      render root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
