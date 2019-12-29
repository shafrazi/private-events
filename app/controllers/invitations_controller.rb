class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @invitee = User.find(params[:invitee_id])

    @event.invitees << @invitee
    flash[:success] = "Invitation sent to #{@invitee.name.capitalize}!"
    redirect_to request.referrer
  end
end
