class InvitationsController < ApplicationController
  before_action :check_event_creator, only: [:create]

  def create
    @invitee = User.find(params[:invitee_id])

    @event.invitees << @invitee
    flash[:success] = "Invitation sent to #{@invitee.name.capitalize}!"
    redirect_to request.referrer
  end

  def accept_invitation
    @event = Event.find(params[:event_id])
    @event.invitees.destroy(current_user)
    @event.attendees << current_user
    flash[:success] = "Invitation accepted!"
    redirect_to request.referrer
  end

  private

  def check_event_creator
    
    @event = Event.find(params[:event_id])
    redirect_to root_path if @event.creator != current_user
  end
end
